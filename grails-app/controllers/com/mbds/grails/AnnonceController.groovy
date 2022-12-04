package com.mbds.grails

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*


class AnnonceController {

    AnnonceService annonceService
    UserService userService
    SpringSecurityService springSecurityService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def currentLoggedInUser = ((User)springSecurityService.getCurrentUser())
        if (currentLoggedInUser.getAuthorities().authority.contains("ROLE_ADMIN")){
            respond annonceService.list(params), model:[annonceCount: annonceService.count(), username: currentLoggedInUser]
        }else{
            respond Annonce.findAllByAuthor(currentLoggedInUser), model:[annonceCount: Annonce.findAllByAuthor(currentLoggedInUser).size()]

        }
         //respond annonceService.list(params), model:[annonceCount: annonceService.count(), username: currentLoggedInUser]
    }

    def show(Long id) {
        respond annonceService.get(id)
    }

    def create() {
        def currentLoggedInUser = ((User)springSecurityService.getCurrentUser())
        respond new Annonce(params), model: [listusers : userService.list(params), user: currentLoggedInUser]
    }

    def save(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }

    def edit(Long id) {
        def currentLoggedInUser = ((User)springSecurityService.getCurrentUser())
        respond annonceService.get(id), model: [listusers : userService.list(params), user: currentLoggedInUser]
    }

    def update(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*'{ respond annonce, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        annonceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
