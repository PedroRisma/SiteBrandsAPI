package sitebrandsapi

import grails.converters.JSON
import groovy.json.JsonSlurper

class BrandsController {

    def index() {
        def url = new URL("http://localhost:8081/brands")
        def connection = (HttpURLConnection) url.openConnection()
        connection.setRequestMethod("GET")
        connection.setRequestProperty("Accept", "application/json")
        connection.setRequestProperty("User-Agent", "Mozilla/5.0")

        JsonSlurper jsonSlurper = new JsonSlurper()
        def brands = jsonSlurper.parse(connection.getInputStream())

        [brands: brands]

    }

    def articles(String id) {
        def urlArt = new URL("http://localhost:8081/brands/" + id + "/article")
        def connectionArt = (HttpURLConnection) urlArt.openConnection()
        connectionArt.setRequestMethod("GET")
        connectionArt.setRequestProperty("Accept", "application/json")
        connectionArt.setRequestProperty("User-Agent", "Mozilla/5.0")

        JsonSlurper jsonSlurper = new JsonSlurper()
        def article = jsonSlurper.parse(connectionArt.getInputStream())

        def articleMap = [article: article]

        render articleMap as JSON
    }

    def getArticle(String id) {
        def urlElem = new URL("http://localhost:8081/article/" + id)
        def connectionElem = (HttpURLConnection) urlElem.openConnection()
        connectionElem.setRequestMethod("GET")
        connectionElem.setRequestProperty("Accept", "application/json")
        connectionElem.setRequestProperty("User-Agent", "Mozilla/5.0")

        JsonSlurper jsonSlurper = new JsonSlurper()
        def element = jsonSlurper.parse(connectionElem.getInputStream())

        def elementMap = [element: element]
        render  elementMap as JSON

    }

    def delArticle(String id){
        def urlArt = new URL("http://localhost:8081/article/" + id)
        def connectionArt = (HttpURLConnection) urlArt.openConnection()
        connectionArt.setRequestMethod("DELETE")
        connectionArt.setRequestProperty("Accept", "application/json")
        connectionArt.setRequestProperty("User-Agent", "Mozilla/5.0")

        connectionArt.getInputStream()

    }

    def addBrand(String brand){
        def urlBrand = new URL("http://localhost:8081/brands")
        def connectionBrand = (HttpURLConnection) urlBrand.openConnection()
        connectionBrand.setDoInput(true)
        connectionBrand.setDoOutput(true)
        connectionBrand.setRequestMethod("POST")
        connectionBrand.setRequestProperty("Content-Type", "application/json")
        connectionBrand.setRequestProperty("Accept", "application/json")
        OutputStreamWriter writer = new OutputStreamWriter(connectionBrand.getOutputStream())
        writer.write(brand)
        writer.flush()

        connectionBrand.getInputStream()
        render index()

    }

    def addArticle(String idBrand, String article){
        println("articulo: " + article)
        println("Marca: " + idBrand)

        def urlArt = new URL("http://localhost:8081/brands/" + idBrand + "/article/")
        def connectionArt = (HttpURLConnection) urlArt.openConnection()
        connectionArt.setDoInput(true)
        connectionArt.setDoOutput(true)
        connectionArt.setRequestMethod("POST")
        connectionArt.setRequestProperty("Content-Type", "application/json")
        connectionArt.setRequestProperty("Accept", "application/json")
        OutputStreamWriter writer = new OutputStreamWriter(connectionArt.getOutputStream())
        writer.write(article)
        writer.flush()

        connectionArt.getInputStream()

    }


    def editArticle(String article, String idArticle){
        def urlArt = new URL("http://localhost:8081/article/" + idArticle)
        def connectionArt = (HttpURLConnection) urlArt.openConnection()
        connectionArt.setDoInput(true)
        connectionArt.setDoOutput(true)
        connectionArt.setRequestMethod("PUT")
        connectionArt.setRequestProperty("Content-Type", "application/json")
        connectionArt.setRequestProperty("Accept", "application/json")
        OutputStreamWriter writer = new OutputStreamWriter(connectionArt.getOutputStream())
        writer.write(article)
        writer.flush()

        connectionArt.getInputStream()
    }
}
