package wireframe

class HomeController {

    def index() {
        if(session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE')
                redirect(url: "/" + session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE');
        else
        {
  		          String lang = request.getLocale().toString();
                if(lang.substring(0,2) == 'zh' && lang.length() >= 5)
                {
                      if(lang.substring(3,5) == 'TW' || lang.substring(3,5) == 'HK')
                      {
                        session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE' = 'zt';
                        lang = 'zt';
                      }
                      else
                      {
                        session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE' = 'zs';
                        lang = 'zs';
                      }

                }
                else
                {
                      session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE' = 'en';
                      lang = 'en';
                }
                redirect(url: "/" + lang);

        }
     }
}
