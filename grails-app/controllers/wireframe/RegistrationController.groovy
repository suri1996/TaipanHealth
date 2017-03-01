package wireframe
import java.util.Random;
import javax.mail.*;
import javax.mail.internet.*;
import java.security.MessageDigest;

class RegistrationController {


    def mailService

    def index()
    {
      String lang = session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE';
      def country = Country.list();

      if(lang.equals('zt'))
      {
        render(view:'index', model: [country : country.name_zt]);
      }
      else if(lang.equals('zs'))
      {
        render(view:'index', model: [country : country.name_zs]);
      }
      else
      {
        render(view:'index', model: [country : country.name_en]);
      }
    }

    def report()
    {
        render (view : 'index', model: [re_controller : 'opinion', re_action : 'review_report'])
    }

    def save() {
        params.phone = '123';
        params.name = '123';
        params.country = '123';
        params.title = 'Sir / Madam';
        def user = new Users(params);
        String lang = session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE';

        /*
        if(lang.equals('zt'))
        {
          user.country = Country.findByName_zt(user.country).id;
        }
        else if(lang.equals('zs'))
        {
          user.country = Country.findByName_zs(user.country).id;
        }
        else
        {
          user.country = Country.findByName_en(user.country).id;
        }
        */
        user.isConfirm = false;
        Random ran = new Random();
        String validateChar = "abcdefghijklmnopqrstuxyvwzABCDEFGHIJKLMNOPQRSTUXYVWZ-*@!1234567890";
        Integer length = validateChar.length();
        String code = "";
        for(int i = 0; i < 40; i++)
        {
            code += validateChar[ran.nextInt(length)];
        }
        user.validationCode = code;
        def success = user.save();
        if(!success)
        {
            flash.email = params.email;
            flash.name = params.name;
            flash.phone = params.phone;
            flash.country = params.country;
            flash.message = "The email has been used"
            redirect(action: 'index' , params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
        }
        else
        {
          /*
               mailService.sendMail {
               to params.email
               from "admin@taipanhealth.com"
               subject "Hello John"
               body 'Please click the link to validate your account ' + 'https://' + request.getServerName() + ':' + request.getServerPort() + '/registration/validate/?email=' + params.email + '&code=' + code
            }
            */
            session.user = params.email;
            session.pwLength = params.password.length();
            session.name = user.email;
            def controll = params.re_controller
            def link = params.re_action
            if(controll && link)
            {
                redirect(controller : controll, action : link, params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
            }
            else
            {
                redirect(uri: "/")
            }


//            redirect(action: 'success', params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
        }
    }


    def validate(){
        def user = Users.findByEmailAndValidationCode(params.email, params.code);
        if(user.isConfirm == true || !user)
        {
          redirect(uri: "/")
        }
        else
        {
          user.isConfirm = true;
          user.validationCode = params.code;
          user.save();
          render(view: "confirm", model: [email : params.email])

        }
    }

    def success()
    {
            def user = Users.findByEmail(session.user);
            session.name = user.email;
            redirect(uri: "/")
            //render(view:"success", model: [email: user.email])
    }



}
