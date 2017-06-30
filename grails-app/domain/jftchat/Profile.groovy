package jftchat
class Profile {
    String bio
    String address
    String city
    String state
    String country
    String mobile
    byte[] photo
    int regId
    static constraints = {
        bio(blank: false,size: 10..100)
        city(blank: false)
        state(blank: false)
        country(blank: false)
        address(blank: false)
        photo nullable: true
        regId(unique: true)
    }
    static mapping = {
        photo column: 'photo', sqlType: 'longblob'
        photo(size: 0..26214400)
        regId column: 'regId', sqlType: 'bigint(20)'
    }
}
