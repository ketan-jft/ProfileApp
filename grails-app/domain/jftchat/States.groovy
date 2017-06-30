package jftchat

class States {
    String name
    static constraints = {
    }
    static belongsTo = [ countries : Countries ]
    static hasMany = [ cities : Cities ]
}
