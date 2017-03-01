package wireframe
import org.xhtmlrenderer.pdf.ITextRenderer;
import static groovy.io.FileType.FILES;
import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.net.InetAddress;
import grails.converters.*;

class OpinionController {
    def mailService
    def groovyPageRenderer
    def indexx() {
      render(view: 'opinion')
    }


    def review_report() {

      def product = ProductList.findByProductType('Radiology Report').list();
      if(session.user)
      {
        def members = Users.findByEmail(session.user).members;
        render(view: 'report_cljs', model : [product : product, members: members]);
      }
      else
      {
        render(view: 'report1', model : [product : product]);
      }
    }

    def question(){
      def member = Member.findById(params.member_select)
      def products = ProductList.findByProductType('Radiology Report').list();
      def array = [];
      def arrayProduct = [];
      Float total = 0;
      Integer num = 0;

        for(int i = 0; i < params.name.size(); i++)
        {
            def myList = [:];
            myList['name'] = params['name'][i]
            myList['price'] = params['price'][i]
            myList['quan'] = params['quan'][i]
            myList['subtotal'] = Float.parseFloat(myList['price']) * Float.parseFloat(myList['quan'])
            if(Integer.parseInt(params['quan'][i]) > 0)
            {
                    array.add(myList)
                    total += myList['subtotal']
                    num++;
            }
            arrayProduct.add(myList);
        }

        render(view: 'question', model : [member: member, product : array, total: total, num: num, arrayProduct : arrayProduct, back : params.back])
    }


    def empty() {
      render [] as JSON
    }

    def medicalBill(){
      def member = Member.findById(params.member_select)
      def products = ProductList.findByProductType('Radiology Report').list();
      def array = [];
      def arrayProduct = [];
      Float total = 0;
      Integer num = 0;

        for(int i = 0; i < Integer.parseInt(params.num); i++)
        {
          if(Integer.parseInt(params.num) > 1)
          {
              def myList = [:];
              myList['name'] = params['name'][i]
              myList['price'] = params['price'][i]
              myList['quan'] = params['quan'][i]
              myList['subtotal'] = Float.parseFloat(myList['price']) * Float.parseFloat(myList['quan'])
              if(Integer.parseInt(params['quan'][i]) > 0)
              {
                      array.add(myList)
                      total += myList['subtotal']
                      num++;
              }
              arrayProduct.add(myList);
          }
          else
          {
            def myList = [:];
            myList['name'] = params['name']
            myList['price'] = params['price']
            myList['quan'] = params['quan']
            myList['subtotal'] = Float.parseFloat(myList['price']) * Float.parseFloat(myList['quan'])
            if(Integer.parseInt(params['quan']) > 0)
            {
                array.add(myList)
                total += myList['subtotal']
                num++;
            }
            arrayProduct.add(myList);
          }
        }

        render(view: 'delivery_cljs', model : [member: member, product : array, total: total, num: num, arrayProduct : arrayProduct, question: params.question, back : params.back])
    }

    def medicalBill_summary(){
      def member = Member.findById(params.member_select)
      def array = [];
      Float total = 0;
      Integer num = 0;
      if(params.address1 != '')
      {
        params.address1 = params.address1 + ',';
      }
      if(params.address2 != '')
      {
        params.address2 = params.address2 + ',';
      }
      params.territory_name = params.territory_name + ',';
      for(int i = 0; i < Integer.parseInt(params.num); i++)
      {
          if(Integer.parseInt(params.num) > 1)
          {
            if(Integer.parseInt(params['quan'][i]) > 0)
            {
                    def myList = [:];
                    myList['name'] = params['name'][i]
                    myList['price'] = params['price'][i]
                    myList['quan'] = params['quan'][i]
                    myList['subtotal'] = Float.parseFloat(myList['price']) * Float.parseFloat(myList['quan'])
                    array.add(myList)
                    total += myList['subtotal']
                    num++;
            }
          }
          else
          {
            if(Integer.parseInt(params['quan']) > 0)
            {
                    def myList = [:];
                    myList['name'] = params['name']
                    myList['price'] = params['price']
                    myList['quan'] = params['quan']
                    myList['subtotal'] = Float.parseFloat(myList['price']) * Float.parseFloat(myList['quan'])
                    array.add(myList)
                    total += myList['subtotal']
                    num++;
            }
          }
      }
      render(view: 'medbill', model : [member: member, product : array, total: total, num: num, back: params.back, address1: params.address1,
      address2: params.address2, territory : params.territory_name, choice: params.choice_delivery, link: params.link, phone : params.phone, question: params.question])
    }



    def addcart(){
      if(params.question == '')
        params.question = 'null';
      def member = Member.findById(params.member_select);
      params.invoiceNo =  Invoice.count() + 1;
      String abc = "";
      if(Invoice.count() == 0)
        abc = "A0000"
      else
      {
        abc = Invoice.last().invoiceNo;
      }
      Integer num = Integer.parseInt(abc.substring(1,5)) + 1;
      int code = 0;
      if(num >= 10000)
      {
        code = (int)abc[0] + 1
        String bb = (char) code;
        num -= 10000;
        params.invoiceNo = bb + '0000';
      }
      else
      {
        String zero = "";
        for(int i = 0; i < 4 - num.toString().length(); i++)
        {
          zero += "0";
        }
        params.invoiceNo = abc[0] + zero + num.toString();
      }
      params.date = new Date();
      params.isPaid = false;
      params.amount = params.total;
      def promotion = Promotion.findByCode(params.promotion_code);
      if(promotion)
      {
        promotion.invoice_no = params.invoiceNo;
        promotion.isUsed = true;
        promotion.save();
      }
      def list = new Invoice(params);
      member.addToInvoices(list).save();
      def array = [];
      for(int i = 0; i < Integer.parseInt(params.num) ; i++)
      {
        if(Integer.parseInt(params.num) > 1)
        {
            def totalList = [:];
            totalList['name'] = params['name'][i]
            totalList['price'] = Float.parseFloat(params['price'][i])
            totalList['quan'] = Integer.parseInt(params['quan'][i])
            totalList['subTotal'] = totalList['price'] * totalList['quan']
            array.add(totalList)
            for(int j = 0; j < Integer.parseInt(params['quan'][i]); j++)
            {
              def myList = [:];
                myList['name'] = params['name'][i]
                myList['price'] = params['price'][i]
              def product = new Product(myList);
              list.addToProducts(product).save();
            }
        }
        else
        {
          def totalList = [:];
          totalList['name'] = params['name']
          totalList['price'] = Float.parseFloat(params['price'])
          totalList['quan'] = Integer.parseInt(params['quan'])
          totalList['subTotal'] = totalList['price'] * totalList['quan']
          array.add(totalList)
          for(int j = 0; j < Integer.parseInt(params['quan']); j++)
          {
            def myList = [:];
              myList['name'] = params['name']
              myList['price'] = params['price']
            def product = new Product(myList);
            list.addToProducts(product).save();
          }
        }
      }
        params.date = g.formatDate(date: params.date, format: 'dd-MM-yyyy')
        params.discount = Integer.parseInt(params.discount);
        def user = Users.findByEmail(session.user)
        String url = request.getRequestURL();
        String uri = request.getRequestURI();
        String link = url.substring(0, url.length() - uri.length()) + '/assets/';
//      URL newUrl = new URL(link + 'TPH_logo_OUT_Eng.png');
//      BufferedImage image = ImageIO.read(newUrl);
//      ByteArrayOutputStream baos = new ByteArrayOutputStream();
//      ImageIO.write(image, "png", baos);
//      byte[] bytes = baos.toByteArray();
//      ByteArrayOutputStream pdfBytes = pdfRenderingService.render(template: "/pdf/textFile",
//      model: [image: bytes, baseURL : link,user: user  , member : member, invoice_date: params.date, invoice_no : params.invoiceNo, array: array, total: params.total ])
        ByteArrayOutputStream pdfBytes = pdfRenderingService.render(template: "/pdf/textFile",
        model: [baseURL : link,user: user  , member : member, invoice_date: params.date, invoice_no : params.invoiceNo, array: array, total: params.total, delivery_method : params.delivery_method, delivery_content : params.delivery_content,
        phone: params.phone, discount : params.discount, net_pay : params.net_pay, question: params.question])

      mailService.sendMail {
      multipart true
      to session.user
      from  "admin@taipanhealth.com"
      bcc "info@taipanhealth.com"
      subject "Thanks for using service from Taipan Health"
      body (view: 'thanks_service', model: [invoiceNo: params.invoiceNo, delivery_method : params.delivery_method, delivery_content : params.delivery_content, discount: params.discount, net_pay : params.net_pay, question: params.question])
      attachBytes params.invoiceNo + '.pdf', "application/pdf", pdfBytes.toByteArray()
      }

      redirect(action: 'thanks' , params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);





      /*
      if(size == 0)
      {
        params.order_id = OrderList.count() + 1;
        params.date = new Date();
        params.isConfirm = false;
        def list = new OrderList(params);
        member.addToOrderLists(list).save();
        for(int i = 0; i < params.name.size(); i++)
        {
          for(int j = 0; j < Integer.parseInt(params['quan'][i]); j++)
          {
            def myList = [:];
            myList['name'] = params['name'][i]
            myList['price'] = params['price'][i]
            def product = new Product(myList);
            list.addToProducts(product).save();
          }
        }

      }
      else
      {

        def orderList = OrderList.findAllByMember(member,[sort: 'order_id', order : 'desc']).first()
        if(orderList.isConfirm == true)
        {
          params.order_id = OrderList.count() + 1;
          params.date = new Date();
          params.isConfirm = false;
          def list = new OrderList(params);
          params.order_id = OrderList.count() + 1;
          params.date = new Date();
          params.isConfirm = false;

          member.addToOrderLists(list).save();
          for(int i = 0; i < params.name.size(); i++)
          {
            for(int j = 0; j < Integer.parseInt(params['quan'][i]); j++)
            {
              def myList = [:];
              myList['name'] = params['name'][i]
              myList['price'] = params['price'][i]

              def product = new Product(myList);

              list.addToProducts(product).save();

            }
          }
        }
        else
        {

          for(int i = 0; i < params.name.size(); i++)
          {
            for(int j = 0; j < Integer.parseInt(params['quan'][i]); j++)
            {
              def myList = [:];
              myList['name'] = params['name'][i]
              myList['price'] = params['price'][i]

              def product = new Product(myList);

              orderList.addToProducts(product).save();

            }


          }
        }





      }
        */



    }

    def review_plan() {
      render(view: 'reviewplan');
    }

    def alternative_plan() {
      render(view: 'newplan');
    }

    def promotion(){
      def code = Promotion.findByCodeAndIsUsed(params.code, false);
      def dateTime = new Date();
      if(code && code.valid_til - dateTime > 0)
      {
        render code.discount_rate;
      }
      else
      {
        render "false"
      }
    }

    def thanks(){
      render(view: 'thanks_page')
    }


    def payment(){
      render (view: 'payment')
    }

    def handle_payment(){

    }


}
