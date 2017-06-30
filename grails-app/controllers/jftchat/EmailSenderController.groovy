package jftchat
import org.springframework.web.multipart.MultipartFile

class EmailSenderController {

    def mailService
    def send(String emailId) {
        def users=Register.findAllByEmailId("${emailId}")
        try {
            mailService.sendMail {
                to emailId
                subject "JFT Chat Notification"
                html "<h2>Hello ${users.fullName.remove(0)} !</h2><p>Click the link below to activate your account</p>" +
                        "<a href='http://localhost:8080/register/userVerify?auth=${users.passCode.remove(0)}'>Click Here</a>"
            }
            flash.message = "Hello ${users.fullName.remove(0)} ! Your Verification Message is sent at " + new Date() + ".  Please check your Registered Email ID."
            redirect(controller: "register", action: "create")
        }
        catch (Exception e){flash.message = "Error is : " + e}
    }
    def sendPassword(String emailId) {
        def users=Register.findAllByEmailId("${emailId}")
        try {
            mailService.sendMail {
                to emailId
                subject "JFT Chat Notification"
                html "<h2>Hello ${users.fullName.remove(0)} !</h2>" +
                        "Your Password is : ${users.password.remove(0)}"
            }
            flash.message = "Hello ${users.fullName.remove(0)} ! Your Password is sent to your registered Email ID at " + new Date() + ".  Please check your mail."
            redirect(controller: "login", action: "forgetPassword")
        }
        catch (Exception e){flash.message = "Error is : " + e}
    }
}
