package wireframe
import javax.mail.*;
import javax.mail.internet.*;
import com.megatome.grails.RecaptchaService;
import groovyx.net.http.HTTPBuilder;

class ContactController {

    def mailService
    def groovyPageRenderer
    RecaptchaService recaptchaService;

    def index()
    {
      render(view: 'contact')
    }

    def reCaptcha()
    {
      def recaptchaOK = true;
      if (!recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params)) {
          recaptchaOK = false
      }
      if(recaptchaOK) {
          recaptchaService.cleanUp(session)
          render "true"
      }
      else {
          render "false"
      }

      def http = new HTTPBuilder( 'https://www.google.com' )

      http.request( POST, JSON ) {
        uri.path = '/recaptcha/api/siteverify'
        uri.query = [ secret:'6Ldo3SYTAAAAAOCvXWynkif2FpZPq8rPzvstGbPS', response: 'params.key' ]

        response.success = { resp, json ->

          render json
        }


      }

  }


    def save() {
        params.date = new Date();
        def contact = new Contact(params);
        def success = contact.save();

        mailService.sendMail {
        to "admin@taipanhealth.com"
        from  params.email
        subject params.message
        body (view: 'template', model: [name: params.name, email: params.email, phone: params.phone ,message : params.message])
        }
        render(view: 'thanks')
    }

}
