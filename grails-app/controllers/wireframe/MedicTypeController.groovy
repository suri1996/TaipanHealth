package wireframe

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MedicTypeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MedicType.list(params), model:[medicTypeCount: MedicType.count()]
    }

    def show(MedicType medicType) {
        respond medicType
    }

    def create() {
        respond new MedicType(params)
    }

    @Transactional
    def save(MedicType medicType) {
        if (medicType == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (medicType.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond medicType.errors, view:'create'
            return
        }

        medicType.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'medicType.label', default: 'MedicType'), medicType.id])
                redirect medicType
            }
            '*' { respond medicType, [status: CREATED] }
        }
    }

    def edit(MedicType medicType) {
        respond medicType
    }

    @Transactional
    def update(MedicType medicType) {
        if (medicType == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (medicType.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond medicType.errors, view:'edit'
            return
        }

        medicType.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'medicType.label', default: 'MedicType'), medicType.id])
                redirect medicType
            }
            '*'{ respond medicType, [status: OK] }
        }
    }

    @Transactional
    def delete(MedicType medicType) {

        if (medicType == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        medicType.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'medicType.label', default: 'MedicType'), medicType.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'medicType.label', default: 'MedicType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
