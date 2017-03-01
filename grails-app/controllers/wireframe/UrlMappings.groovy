package wireframe
import org.springframework.web.servlet.support.RequestContextUtils as RCU

class UrlMappings {


    //

    static mappings = {
    //
    //
       "/$lang/$controller/$action?/$id?(.$format)?"{

          constraints {
              // apply constraints here
              lang(validator:{
                  return (it in['en', 'zt', 'zs'])
              })
          }
      }

        "/" (controller: 'home')
        "/sign" (controller: 'sign')
        "/test" (controller: 'test')

        "/$lang" (view: '/index') {
            constraints {lang(validator:{return (it in['en', 'zt', 'zs'])})}
        }

        "/captcha" (view:"captcha")
        "/robots.txt" (view:"/robots")
        "500" (view:'/error')
        "404" (view:'/notFound')
        "/sitemap" (controller: 'sitemap')

        //"/sign"(view:"captcha")
        "/$lang/about"(controller:"about", action: "index"){constraints {lang(validator:{return (it in['en', 'zt', 'zs'])})}}
        "/$lang/contact"(controller:"contact", action: "index"){constraints {lang(validator:{return (it in['en', 'zt', 'zs'])})}}
        "/$lang/recruit"(controller:"recruit", action: "index"){constraints {lang(validator:{return (it in['en', 'zt', 'zs'])})}}
        "/$lang/opinion"(controller:"opinion", action: "indexx"){constraints {lang(validator:{return (it in['en', 'zt', 'zs'])})}}
        "/$lang/faq"(controller:"faq", action: "index"){constraints {lang(validator:{return (it in['en', 'zt', 'zs'])})}}
        "/$lang/storage"(controller:"storage", action: "index"){constraints {lang(validator:{return (it in['en', 'zt', 'zs'])})}}
        "/$lang/terms&conditions"(controller:"terms", action: "index"){constraints {lang(validator:{return (it in['en', 'zt', 'zs'])})}}
        "/$lang/privacy_policy"(controller:"privacy_policy", action: "index"){constraints {lang(validator:{return (it in['en', 'zt', 'zs'])})}}
    }


}
