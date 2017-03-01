package wireframe
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
import grails.converters.JSON;
import javax.mail.*;
import javax.mail.internet.*;
import com.lowagie.text.pdf.PdfWriter
class UserController {

    def mailService;

    private String md5_password(String password)
    {
      MessageDigest md5Digest;
      byte[] digest;
      md5Digest = MessageDigest.getInstance("SHA-512");
      md5Digest.reset();
      md5Digest.update(password.getBytes());
      digest = md5Digest.digest();
      String md5_password = new BigInteger(1,digest).toString(16);
      return md5_password;
    }

    def index()
    {

    }

    def report()
    {

      render (view : 'index', model: [re_controller : 'opinion', re_action : 'review_report'])
    }



    def login()
    {
        Integer pwLength = params.password.length();
        params.password = md5_password(params.password);
        def user = Users.findByEmailAndPassword(params.email, params.password);
        if(user)
        {
            session.user = user.email;
            session.name = user.email;
            session.pwLength = pwLength;
            def controll = params.re_controller
            def link = params.re_action

            if(controll && link)
            {
                redirect(controller : controll, action : link, params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
            }
            else
                redirect(uri: '/' + session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE');
        }
        else
        {
          flash.message = "Incorrect id or password";
          redirect(action: 'index', params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
        }
    }



    def logout()
    {
        session.user = null;
        session.name = null;
        redirect(url: "/" + session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE' );
    }


    def info()
    {
      def user = Users.findByEmail(session.user);
      String password = "";
      for(int i = 0 ; i < session.pwLength; i++)
      {
        password += '*';
      }
      def country;
      String lang = session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE';
      def country_list = Country.list();
      /*
      if(lang.equals('zt'))
      {
          country = Country.findById(user.country).name_zt;

      }
      else if(lang.equals('zs'))
      {
          country = Country.findById(user.country).name_zs;

      }
      else
      {
          country = Country.findById(user.country).name_en;

      }
      */
      render(view: 'info', model: [parmas: user, password : password, country : 'Hong Kong', country_list: country_list ])
    }


    def group()
    {
        def user = Users.findByEmail(session.user);
        String[] month_en = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        String[] month_zt = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
        String[] month_zs = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月" , "十月", "十一月", "十二月"]

        render (view: 'group', model: [user : user, month_en : month_en, month_zt : month_zt, month_zs : month_zs])
      /*
            def user = Users.findByEmail(session.user);
            def member = new Member([user_id: session.user,  country : 'Hong Kong', dob : new Date(), email : 'abc@gmail.com', gender : 'M', name : 'abc'])
            user.addToMembers(member).save();
      */
    }

    def group_new_user()
    {
        def user = Users.findByEmail(session.user);
        String[] month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        render (view: 'group_new_user', model: [user : user, month : month])
      /*
            def user = Users.findByEmail(session.user);
            def member = new Member([user_id: session.user,  country : 'Hong Kong', dob : new Date(), email : 'abc@gmail.com', gender : 'M', name : 'abc'])
            user.addToMembers(member).save();
      */
    }


    def duplicate_check_group()
    {
        def member = Member.findByEmail(params.email);
        if(member)
            render false;
        else
            render true;
    }

    def add_new_member()
    {
      Date today = new Date();
      String[] month_en = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

      params.month = month_en[Integer.parseInt(params.month) - 1];
      String dateString = params.year + "-" + params.month + "-" + params.day;
      Date predefined = new SimpleDateFormat("yyyy-MMM-dd").parse(dateString);
      def member;
      def country;
      if(session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt')
      {
        country = Country.findByName_zt(params.country_name_zt);
      }
      else if(session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs')
      {
        country = Country.findByName_zs(params.country_name_zs);
      }
      else
      {
        country = Country.findByName_en(params.country_name_en);
      }
      if(params.gender == 'Male')
      {
        params.gender = 'M'
      }
      else if(params.gender == 'Female')
      {
        params.gender = 'F'
      }
      params.dob = predefined;
      params.user_id = session.user;
      params.country_name_en = country.name_en;
      params.country_name_zt = country.name_zt
      params.country_name_zs = country.name_zs;
      def user = Users.findByEmail(session.user);
      member = new Member(params)
      user.addToMembers(member).save();


      redirect(controller:'opinion' , action: 'review_report' , params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
    }

    def edit()
    {
      Date today = new Date();
      String[] month_en = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

      params.month = month_en[Integer.parseInt(params.month) - 1];
      String dateString = params.year + "-" + params.month + "-" + params.day;
      Date predefined = new SimpleDateFormat("yyyy-MMM-dd").parse(dateString);
      def member;
      def country;
      if(session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zt')
      {
        country = Country.findByName_zt(params.country_name_zt);
      }
      else if(session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'.toString() == 'zs')
      {
        country = Country.findByName_zs(params.country_name_zs);
      }
      else
      {
        country = Country.findByName_en(params.country_name_en);
      }
      if(params.gender == 'Male')
      {
        params.gender = 'M'
      }
      else if(params.gender == 'Female')
      {
        params.gender = 'F'
      }
      if(params.submit_type == "1")
      {

        params.dob = predefined;
        params.user_id = session.user;
        params.country_name_en = country.name_en;
        params.country_name_zt = country.name_zt
        params.country_name_zs = country.name_zs;
        def user = Users.findByEmail(session.user);
        member = new Member(params)
        user.addToMembers(member).save();
      }
      else
      {
        member = Member.findById(params.member_id);
        member.dob  = predefined;
        member.title = params.title;
        member.firstName = params.firstName;
        member.lastName = params.lastName;
        member.gender = params.gender;
        member.country_name_en = country.name_en;
        member.country_name_zt = country.name_zt;
        member.country_name_zs = country.name_zs;
        member.email = params.email;
        member.phone = params.phone;
        member.save();
      }

      redirect(action:'group' , params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);

    }

    def delete()
    {
      def member =  Member.findById(params.delete_id)

      member.delete();
      redirect(action:'group' , params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
    }


    def delete_multiple(){
    if(params.id != "")
    {
          String id = params.id;
          id = id.substring(0, id.length()-1);
          String[] array = id.split("\\,", -1);
          for(int i = 0; i < array.size(); i++)
          {
                def member =  Member.findById(array[i]);
                member.delete();
          }
      }
        redirect(action:'group' , params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
    }

    def change_password(){

    }



    def password_check(){

      String password = md5_password(params.old_password);
      def user = Users.findByEmailAndPassword(session.user, password);
      if(user)
      {
          user.password = md5_password(params.new_password);
          session.pwLength = params.new_password.length();
          user.save();
          redirect(action: 'info', params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
      }
      else
      {
          flash.message = "Incorrect password";
          redirect(action: 'change_password', params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
      }
    }

    def check()
    {

      if ( params.text && params.text.length() > 0 ) {
      	render params.text;
      } else {
      	render "Empty";
      }
    }

    def edit_info()
    {
      def user = Users.findByEmail(session.user);
      if(params.tag == 'name')
      {
        user.name = params.text;
      }
      else if(params.tag == 'phone')
      {
        user.phone = params.text;
      }

      user.save();
      render params.text;
    }

    def edit_country()
    {
          def user = Users.findByEmail(session.user);
          user.country = params.text;
          user.save();
    }

    def history()
    {
      def user = Users.findByEmail(session.user);
      if(user.members.size() > 0)
      {
        def invoices = Invoice.findAllByMemberInList(user.members)
        render (view: 'history', model: [user: user,invoices: invoices])
      }
      else
        render (view : 'history', model : [user: user, invoices: null])
    }





    def generate_pdf()
    {
      redirect(controller: 'pdf', action: 'index', params: [lang: 'en'])
    }

    def forget_password()
    {
      render(view : 'forget_password')
    }

def password_reset()
{
  def user = Users.findByEmail(params.email);
//  if(user && user.phone == params.phone.toString())
  if(user)
  {
    String url = request.getRequestURL();
    String uri = request.getRequestURI();
    String link = url.substring(0, url.length() - uri.length()) + '/'  + session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE'  + '/user/index';
    Random ran = new Random();
    String validateChar = "abcdefghijklmnopqrstuxyvwzABCDEFGHIJKLMNOPQRSTUXYVWZ1234567890";
    Integer length = validateChar.length();
    String code = "";
    for(int i = 0; i < 6; i++)
    {
        code += validateChar[ran.nextInt(length)];
    }
    user.password = md5_password(code);
    user.save();
    mailService.sendMail {
    to params.email
    from  'admin@taipanhealth.com'
    subject 'Password reset'
    body (view: 'template', model: [pw: code , link : link])
    }
    render (view: 'reset_success')
  }
  else
  {
      flash.message = "Incorrect email or phone";
      redirect(action: 'forget_password', params: [lang: session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE']);
  }

}


}
