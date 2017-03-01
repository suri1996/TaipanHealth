package wireframe

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MedicController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Medic.list(params), model:[medicCount: Medic.count()]
    }

    def show(Medic medic) {
        respond medic
    }



    def create() {
        respond new Medic(params)
    }

    @Transactional
    def save(Medic medic) {
        if (medic == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (medic.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond medic.errors, view:'create'
            return
        }

        medic.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'medic.label', default: 'Medic'), medic.id])
                redirect (action: 'index',  params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
            }
            '*' { respond medic, [status: CREATED] }
        }
    }

    def edit(Medic medic) {
        respond medic
    }

    @Transactional
    def update(Medic medic) {
        if (medic == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (medic.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond medic.errors, view:'edit'
            return
        }

        medic.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'medic.label', default: 'Medic'), medic.id])
                redirect medic
            }
            '*'{ respond medic, [status: OK] }
        }
    }

    @Transactional
    def delete(Medic medic) {

        if (medic == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        medic.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'medic.label', default: 'Medic'), medic.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'medic.label', default: 'Medic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
