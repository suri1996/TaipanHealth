package wireframe

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class HospitalController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Hospital.list(params), model:[hospitalCount: Hospital.count()]
    }

    def show(Hospital hospital) {
        respond hospital
    }

    def create() {
        respond new Hospital(params)
    }

    @Transactional
    def save(Hospital hospital) {
        if (hospital == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (hospital.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond hospital.errors, view:'create'
            return
        }

        hospital.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'hospital.label', default: 'Hospital'), hospital.id])
                redirect (action: 'index',  params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
            }
            '*' { respond hospital, [status: CREATED] }
        }
    }

    def edit(Hospital hospital) {
        respond hospital
    }

    @Transactional
    def update(Hospital hospital) {
        if (hospital == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (hospital.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond hospital.errors, view:'edit'
            return
        }

        hospital.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'hospital.label', default: 'Hospital'), hospital.id])
                redirect(action:"index", params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
            }
            '*'{ respond hospital, [status: OK] }
        }
    }

    @Transactional
    def delete(Hospital hospital) {

        if (hospital == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        hospital.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'hospital.label', default: 'Hospital'), hospital.id])
                redirect(action:"index", method:"GET", params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'hospital.label', default: 'Hospital'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
