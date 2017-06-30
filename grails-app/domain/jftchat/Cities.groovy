package jftchat

class Cities {
    String name
    static constraints = {
    }
    static belongsTo = [ states : States ]
}
