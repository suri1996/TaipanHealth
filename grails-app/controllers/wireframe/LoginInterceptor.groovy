package wireframe


class LoginInterceptor {

    LoginInterceptor(){
        //matchAll().excludes(controller: 'user')
        match(controller: 'user', action: 'info')
        match(controller: 'service', action: 'secondOpinion')
        match(controller: 'usercenter')
    }

    boolean before()
    {
        if (!session.user) {
            redirect(controller : 'user', action: 'index', params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'])
        return false;
        }
        return true;

    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
