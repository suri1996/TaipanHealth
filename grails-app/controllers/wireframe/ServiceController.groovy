package wireframe

class ServiceController {

    def index()
    {

    }


    def scan()
    {
        params.service = "1"
        HeadCapture capture = new HeadCapture(params);
        capture.save();
        redirect(uri:'/' + session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE')
    }

    def clinic()
    {
      params.service = "2"
      HeadCapture capture = new HeadCapture(params);
      capture.save();
      redirect(uri: '/' + session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE')
    }

    def secondOpinion()
    {
        render(view:'SecondOpinion')
    }

}
