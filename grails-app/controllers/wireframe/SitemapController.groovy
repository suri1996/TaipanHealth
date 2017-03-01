package wireframe
import groovy.xml.MarkupBuilder
import java.lang.reflect.Method
import grails.web.Action


class SitemapController {
  def sitemap = {
      render(contentType: 'text/xml', encoding: 'UTF-8') {
          mkp.yieldUnescaped '<?xml version="1.0" encoding="UTF-8"?>'
          urlset(xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9",
                  'xmlns:xsi': "http://www.w3.org/2001/XMLSchema-instance",
                  'xsi:schemaLocation': "http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd") {
              url {
                  loc(g.createLink(absolute: true, controller: 'about', action: 'index', params: [lang : message(code: 'en')]))
                  changefreq('hourly')
                  priority(1.0)
              }
              url {
                  loc(g.createLink(absolute: true, controller: 'clinic_finder', action: 'hongkong', params: [lang : message(code: 'en')]))
                  changefreq('hourly')
                  priority(1.0)
              }
              url {
                  loc(g.createLink(absolute: true, controller: 'clinic_finder', action: 'orthopedics', params: [lang : message(code: 'en')]))
                  changefreq('hourly')
                  priority(1.0)
              }
              url {
                  loc(g.createLink(absolute: true, controller: 'clinic_finder', action: 'oncology', params: [lang : message(code: 'en')]))
                  changefreq('hourly')
                  priority(1.0)
              }
              url {
                  loc(g.createLink(absolute: true, controller: 'clinic_finder', action: 'aesthetic_surgery', params: [lang : message(code: 'en')]))
                  changefreq('hourly')
                  priority(1.0)
              }
              url {
                  loc(g.createLink(absolute: true, controller: 'contact', action: 'index', params: [lang : message(code: 'en')]))
                  changefreq('hourly')
                  priority(1.0)
              }
              url {
                  loc(g.createLink(absolute: true, controller: 'faq', action: 'index', params: [lang : message(code: 'en')]))
                  changefreq('hourly')
                  priority(1.0)
              }
              url {
                  loc(g.createLink(absolute: true, controller: 'opinion', action: 'index', params: [lang : message(code: 'en')]))
                  changefreq('hourly')
                  priority(1.0)
              }
              url {
                  loc(g.createLink(absolute: true, controller: 'recruit', action: 'index', params: [lang : message(code: 'en')]))
                  changefreq('hourly')
                  priority(1.0)
              }
              url {
                  loc(g.createLink(absolute: true, controller: 'scan', action: 'body_part', params: [lang : message(code: 'en')]))
                  changefreq('hourly')
                  priority(1.0)
              }
              url {
                  loc(g.createLink(absolute: true, controller: 'scan', action: 'bone', params: [lang : message(code: 'en')]))
                  changefreq('hourly')
                  priority(1.0)
              }
              url {
                  loc(g.createLink(absolute: true, controller: 'scan', action: 'organ', params: [lang : message(code: 'en')]))
                  changefreq('hourly')
                  priority(1.0)
              }
              url {
                  loc(g.createLink(absolute: true, controller: 'scan', action: 'other', params: [lang : message(code: 'en')]))
                  changefreq('hourly')
                  priority(1.0)
              }
              url {
                  loc(g.createLink(absolute: true, controller: 'storage', action: 'index', params: [lang : message(code: 'en')]))
                  changefreq('hourly')
                  priority(1.0)
              }
              //add some dynamic entries
              /*
              Company.list().each {domain->
              url {
                  loc(g.createLink(absolute: true, controller: 'some', action: 'view', id: domain.id))
                  changefreq('hourly')
                  priority(0.8)
              }
          }
          */
     }
}
}


}
