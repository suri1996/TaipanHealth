package wireframe
import org.xhtmlrenderer.pdf.ITextRenderer;
import static groovy.io.FileType.FILES;
import java.io.File;
import java.io.FileInputStream;
import grails.util.Holders;
import java.net.URL;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.net.InetAddress;

class PdfController {

    def index() {
        redirect(action: 'show' , params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
     }

     def test(){
       String url = request.getRequestURL();
       String uri = request.getRequestURI();
       String link = url.substring(0, url.length() - uri.length()) + '/assets/';
       URL newUrl = new URL(link + 'TPH_logo_OUT_Eng.png');
       BufferedImage image = ImageIO.read(newUrl);
       ByteArrayOutputStream baos = new ByteArrayOutputStream();
       ImageIO.write(image, "png", baos);
       byte[] bytes = baos.toByteArray();
       render (template: 'textFile', model : [image: bytes, baseURL : link])
     }



     def show = {
       if(session.user == null)
        render (view: '/error')
        else{

       def invoice = Invoice.findById(params.invoice)
       def array = [];
       Boolean isSame = false;
       Float total = 0;
       for(int i = 0; i < invoice.products.size(); i++)
       {
          isSame = false;
          for(int j = 0; j < array.size(); j++)
          {
            if(invoice.products[i].name.toString() == array[j]['name'].toString())
            {
              array[j]['quan'] = array[j]['quan'] + 1;
              array[j]['subTotal'] = array[j]['subTotal'] + array[j]['price']
              total += array[j]['price']
              isSame = true;
            }
          }
            if(!isSame)
            {
              def myList = [:]
              myList['name'] = invoice.products[i].name
              myList['price'] = Float.parseFloat(invoice.products[i].price)
              myList['quan'] = 1;
              myList['subTotal'] = myList['price']
              total += myList['price']
              array.add(myList)
            }
       }
       def promotion = Promotion.findByCode(invoice.promotion_code);
       Float discount_rate = 0;
       Float discount = 0;
       if(promotion)
       {
         discount_rate = promotion.discount_rate;
         discount = invoice.amount * discount_rate / 100;
       }
      Float net_pay = invoice.amount - discount;
      Map parameters = ["pdf.encoding":"UniGB-UCS2-H", "font.family": "STSong-Light"];
      def user = Users.findByEmail(session.user)
      String url = request.getRequestURL();
      String uri = request.getRequestURI();
      String link = url.substring(0, url.length() - uri.length()) + '/assets/';
//      URL newUrl = new URL(link + 'TPH_logo_OUT_Eng.png');
//      BufferedImage image = ImageIO.read(newUrl);
//      ByteArrayOutputStream baos = new ByteArrayOutputStream();
//      ImageIO.write(image, "png", baos);
//      byte[] bytes = baos.toByteArray();
      renderPdf(template: 'textFile', model : [baseURL : link,user: user  ,member : params.member, invoice_date: invoice.date.toString().substring(0,10), invoice_no : invoice.invoiceNo, array: array, total: total,
      delivery_method : invoice.delivery_method, delivery_content : invoice.delivery_content, phone: invoice.phone, discount : discount, net_pay : net_pay, question : invoice.question])

     }
    }

}
