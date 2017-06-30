package jftchat
import groovy.json.*
class AngularJSController {

    def index() { }
    def getCity(){
//        def jsons=new JsonSlurper()
        List<Countries> cities= Countries.list();
//        def ob=jsons.parseText '''
//        { "City": "${cities.name}",
//          "ID": \"${cities.id}\"
//        }'''
        render("{\"records\":")
//        render ob
        render("{\"City\":\"${cities.name.join("\",\"")}\"},{\"ID\":\"${cities.id.join("\",\"")}\"}")
        render("}")
    }
}