package jftchat

import javax.imageio.ImageIO
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part
import groovy.transform.InheritConstructors
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest
import org.springframework.web.multipart.commons.CommonsMultipartFile

import javax.mail.Multipart
import java.awt.image.BufferedImage
import java.sql.Blob

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ProfileController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
    def index() {
        String user=(String)session.getAttribute("jftUser")
        if(user==null)
        {
            redirect(controller:"login",action: "index")
        }
    }
    def delProfile(){
        String regId=(String)session.getAttribute("jftUserId")
        def p=Profile.findByRegId(regId)
        p.delete flush: true
        if(p.delete())
        {
            redirect(url: "http://localhost:8080/profile/")
        }
    }
    String alphabet = (('A'..'N')+('P'..'Z')+('a'..'k')+('m'..'z')+('2'..'9')).join()

    def n = 100

    def giveMeKey(){
        def key
        for(def i=0;i<50;i++){
            key = new Random().with {
                (1..n).collect { alphabet[ nextInt( alphabet.length() ) ] }.join()
            }
        }
        return key
    }
    def changePhoto(Profile profile) throws IOException{
        MultipartFile uploadedFile = null
        if (request instanceof MultipartHttpServletRequest) {
            uploadedFile = request.getFile("photo")
        }
        BufferedImage image =ImageIO.read(uploadedFile.getInputStream());
        Integer width = image.getWidth();
        Integer height = image.getHeight();
        if (width<250 || height <250) {
            flash.error = g.message(code:'',default:'Empty cannot be uploaded')
            redirect(action: 'index')
            return
        }
        InputStream inputStream = uploadedFile.inputStream
        byte[] bytes=inputStream.getBytes()
        String regId=(String)session.getAttribute("jftUserId")
        long id=Profile.findByRegId(regId).id
        Profile.executeUpdate("update Profile set photo = ?" +
                "where id = ? and regId = ?", [bytes,id,regId.toInteger()])
        redirect(url: "http://localhost:8080/profile/")
    }
    @Transactional
    def save() {
        String ctr=request.getParameter("ctr")
        String regId=(String)session.getAttribute("jftUserId")
        if(ctr=="1")
        {
            long id=Profile.findByRegId(regId).id
            Profile.executeUpdate(
            "update Profile set bio = ?,address = ?,city = ?,state = ?,country = ?,mobile = ?" +
                    "where id = ? and regId = ?", [params.bio,params.address,params.city,
                                                   params.state,params.country,
                                                   params.mobile,id,regId.toInteger()])
            flash.message = "Your Information is successfully Updated"
            redirect(url: "http://localhost:8080/profile/edit?ctr=1&user=${regId}&session=${giveMeKey()}")
        }
        else
        {
            Profile profileInstance = new Profile(params)
            profileInstance.validate()
            if (profileInstance == null) {
                notFound()
                return
            }
            if (profileInstance.hasErrors()) {
                respond profileInstance.errors, view:'edit'
                return
            }
            profileInstance.properties=params
            profileInstance.save flush:true
            if(profileInstance.save()) {
                flash.message = "Your Information is successfully Inserted"
                redirect(url: "http://localhost:8080/profile/edit?ctr=1&user=${regId}&session=${giveMeKey()}")
            }
        }
    }
    def edit(){
        String user=(String)session.getAttribute("jftUser")
        if(user==null)
        {
            redirect(controller:"login",action: "index")
        }
    }

    @Transactional
    def update(Profile profile) {
        if (profile == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }
        if (profile.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond profile.errors, view:'edit'
            return
        }
        profile.save flush:true
    }

    @Transactional
    def delete(Profile profile) {

        if (profile == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        profile.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'profile.label', default: 'Profile'), profile.regId])
                redirect action:"edit", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'profile.label', default: 'Profile'), params.id])
                redirect action: "/", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    def pic() {
        response.setHeader 'Content-Type', 'image/jpg'
        response.outputStream.withStream {it << Profile.findById(params.id).photo}
    }
}