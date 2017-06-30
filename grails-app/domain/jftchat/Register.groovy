package jftchat

class Register {
    String fullName
    String emailId
    String userName
    String password
    String passCode
    boolean isActive
    static constraints = {
        fullName(blank: false,size: 5..25)
        emailId(blank: false,email: true,unique: true)
        userName(blank: false,unique: true,size: 6..15)
        password(blank: false,size: 6..15)
        passCode(blank: true)
    }
    static mapping = {
        isActive defaultValue: 0
    }
    String toString() { return "$id" }
}