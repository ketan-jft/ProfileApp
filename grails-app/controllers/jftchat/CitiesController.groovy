package jftchat
import grails.converters.*
class CitiesController {
    def ajaxCityFinder = {
        def create=Cities.createCriteria()
        def citiesFound = create.list {
            like('name', "${params.term + '%'}")
        }
        render (citiesFound as JSON)
    }
    def index() { }
}
