package jftchat

class Countries {
    String sortname
    String name
    int phonecode
    static constraints = {
    }
    static hasMany = [ states : States ]
}
