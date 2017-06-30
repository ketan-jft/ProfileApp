package jftchat

import groovy.transform.InheritConstructors
import org.springframework.context.MessageSource

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RegisterController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Register.list(params), model:[registerCount: Register.count()]
    }

    def create() {
        respond new Register(params)
    }

    @InheritConstructors
    class CreateUserException extends RuntimeException { }


    def createRegister(String fullName, String emailId, String userName, String password) {
        if (Register.countByEmailId(emailId)){
            throw new CreateUserException("EMAIL ID is in use. Please Try with different Email ID")
        }
        if (Register.countByUserName(userName)){
            throw new CreateUserException("Username is in use. Please Try with different Username")
        }
        def user = new Register(fullName: fullName,emailId: emailId, userName: userName, password: password)
        user.save()
    }

    String alphabet = (('A'..'N')+('P'..'Z')+('a'..'k')+('m'..'z')+('2'..'9')).join()

    def n = 40

    def giveMeKey(){
        def key
        for(def i=0;i<50;i++){
            key = new Random().with {
                (1..n).collect { alphabet[ nextInt( alphabet.length() ) ] }.join()
            }
        }
        return key
    }

    def MessageSource messageSource

    @Transactional
    def save() {
        Register registerInstance = new Register(params)
        def emailId=registerInstance.emailId
        registerInstance.validate()
        if (registerInstance == null) {
            notFound()
            return
        }
        if (registerInstance.hasErrors()) {
            respond registerInstance.errors, view:'create'
            return
        }
//        String msg=messageSource.getMessage("default.created.user",null,null)
        registerInstance.save flush:true
        if(registerInstance.save()) {
            def query = Register.where {
                emailId == emailId
            }
            int total = query.updateAll(passCode: giveMeKey())
//            flash.message = "Hello ${registerInstance.fullName} ! " + msg
            redirect(url: "http://localhost:8080/emailSender/send?emailId=${emailId}")
        }
//        respond registerInstance.save(), view:'create'
    }
    def userVerify(String auth){
        int total
        def passCode
        def users=Register.findAllByPassCode("${auth}")
        if(users.size() == 1)
        {
            passCode=users.passCode.remove(0)
            def query = Register.where {
                passCode == passCode
            }
            total = query.updateAll(isActive: true)
            if(total==1)
            {
                int delete = query.updateAll(passCode: "")
                flash.message = "You are successfully verified at " + new Date() + ". Now Login to Continue using JFT Chat"
                redirect(controller: "login", action: "index")
            }
        }
        else
        {
            flash.message = "Your session is expired."
            redirect(controller: "login", action: "index")
        }

    }
    def edit(Register register) {
        respond register
    }

    @Transactional
    def update(Register register) {
        if (register == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (register.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond register.errors, view:'edit'
            return
        }

        register.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'register.label', default: 'Register'), register.id])
                redirect register
            }
            '*'{ respond register, [status: OK] }
        }
    }

    @Transactional
    def delete(Register register) {

        if (register == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        register.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'register.label', default: 'Register'), register.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'register.label', default: 'Register'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def show(Register register) {
        respond register
    }
}
