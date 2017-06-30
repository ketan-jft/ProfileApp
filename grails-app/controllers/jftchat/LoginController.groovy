package jftchat

class LoginController {

    def index() { }
    def forgetPassword(){}
    def verifyUser(String userName,String password){
        def users=Register.findAllByUserNameAndPassword(userName,password)
        if(users.size() == 1) {
            boolean isActive = users.isActive.remove(0)
            String emailId = users.emailId.remove(0)
            if (isActive) {
                session.setAttribute("jftUser","${users.userName.remove(0)}")
                session.setAttribute("jftUserId","${users.id.remove(0)}")
                flash.message = "You have successfully Logged In"
                redirect(controller: "profile", action: "index")
            } else {
                redirect(url: "http://localhost:8080/emailSender/send?emailId=${emailId}")
            }
        }
        else
        {
            flash.message = "Please enter correct Username and Password"
            redirect(controller: "login", action: "index")
        }
    }
    def logout(){
        session.invalidate()
        flash.message = "You are successfully Logout. Please Login again to continue."
        redirect(controller: "login", action: "index")
    }
    def sendAuth(String userName){
        def users=Register.findAllByUserNameOrEmailId(userName,userName)
        if(users.size() == 1) {
            boolean isActive = users.isActive.remove(0)
            String emailId = users.emailId.remove(0)
            if (isActive) {
                redirect(url: "http://localhost:8080/emailSender/sendPassword?emailId=${emailId}")
            } else {
                redirect(url: "http://localhost:8080/emailSender/send?emailId=${emailId}")
            }
        }
        else
        {
            flash.message = "Please enter correct Username and Email ID"
            redirect(controller: "login", action: "forgetPassword")
        }
    }
}
