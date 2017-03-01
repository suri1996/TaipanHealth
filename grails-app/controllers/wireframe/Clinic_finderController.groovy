package wireframe
import grails.converters.JSON
class Clinic_finderController {

    def index() { }

    def hongkong() {
      String lang = session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE';
      def company = Company.list();
      def territory = Territory.findByCountry("Hong Kong").list();
      def purpose = MedicType.list();
      if(lang.equals('zt'))
      {
        render(view:'hongkong', model: [company : company, territory : territory, purpose : purpose]);
      }
      else if(lang.equals('zs'))
      {
        render(view:'hongkong', model: [company : company, territory : territory, purpose : purpose]);
      }
      else
      {
        render(view:'hongkong', model: [company : company, territory : territory, purpose : purpose]);
      }
    }



    def finder_interested(){
      params.service = "2"
      HeadCapture capture = new HeadCapture(params);
      capture.save();
      redirect(uri: '/' + session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE')
    }

    def plan_select(){
      String lang = session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE';
      def plan = Company.findById(params.company).plans;
      if(lang.equals('zt'))
      {

        render g.select(id:'subCategory', name:'subCategory.id',
            from: plan, optionKey:'name_en', optionValue: 'name_zt' , noSelection:['':'null_select']
        )
      }
      else if(lang.equals('zs'))
      {
        render g.select(id:'subCategory', name:'subCategory.id',
            from:plan, optionKey:'name_en',  optionValue: 'name_zs' , noSelection:['':'null_select']
        )
      }
      else
      {
        render g.select(id:'subCategory', name:'subCategory.id',
            from:plan, optionKey:'name_en',  optionValue: 'name_en' , noSelection:['':'null_select']
        )
      }
    }


    def territory_select(){
      String lang = session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE';
        def district = Territory.findByName_en(params.territory).districts;
      if(lang.equals('zt'))
      {
        render g.select(id:'district', name:'district',
            from: district, optionKey:'name_en', optionValue: 'name_zt' , noSelection:['':'null_select']
        )
      }
      else if(lang.equals('zs'))
      {
        render g.select(id:'district', name:'district',
            from:district, optionKey:'name_en',  optionValue: 'name_zs' , noSelection:['':'null_select']
        )
      }
      else
      {
        render g.select(id:'district', name:'district',
            from:district, optionKey:'name_en',  optionValue: 'name_en' , noSelection:['':'null_select']
        )
      }
    }

    def find_hospital()
    {


      //def hospital = Hospital.findByMedicTypeAndDistrict(params.purpose, params.district).list();


      //render hospital.location_en;

    }


    def find_medic()
    {
      HashMap jsonMap = new HashMap();

      //def medic = Medic.findByMedicTypeAndPlan(params.purpose, params.plan).list();
      def hospital;
      if(params.company == '')
      {
        hospital = Hospital.findByCountry("Hong Kong").list();
      }
      else
      {
        hospital = Hospital.findByCountryAndCompany("Hong Kong", params.company).list();
      }
      int size = hospital.size();
      if(!params.district.equals(''))
      {
          for(int i = size - 1; i >= 0 ; i--)
          {
            if(!hospital[i].district.toString().equals(params.district))
              hospital.remove(i);
          }
      }
      else if(!params.territory.equals(''))
      {
          for(int i = size - 1; i >= 0 ; i--)
          {

              if(!hospital[i].territory.toString().equals(params.territory))
                hospital.remove(i);
          }
      }
      //Integer claim = Plan.findByName_en(params.plan).claim;
      String lang = session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE';
      if(lang.equals('zt'))
      {
            jsonMap.hospital = hospital.collect{hospi ->
            return [id: hospi.id, name: hospi.name_zt, location: hospi.location_zt, latitude : hospi.latitude, longitude : hospi.longitude, type : hospi.type]}
            //jsonMap.medic = medic.collect{medi ->
            //return [id: medi.id, name: medi.name_zt, charge: medi.charge, hospital:  medi.hospital.name_zt, website: medi.hospital.website , district: medi.hospital.district.name_zt ,googlemap : medi.hospital.location_zt ,location : medi.hospital.location_zt ,claims: claim, netpay: medi.charge - claim < 0 ? 0 : medi.charge - claim]}
            render jsonMap as JSON;
      }
      else if(lang.equals('zs'))
      {
            jsonMap.hospital = hospital.collect{hospi ->
            return [id: hospi.id, name: hospi.name_zs, location: hospi.location_zs, latitude : hospi.latitude, longitude : hospi.longitude, type : hospi.type]}
            //jsonMap.medic = medic.collect{medi ->
            render jsonMap as JSON;
            //jsonMap.medic = medic.collect{medi ->
            //return [id: medi.id, name: medi.name_zs, charge: medi.charge, hospital: medi.hospital.name_zs, website: medi.hospital.website , district: medi.hospital.district.name_zs ,googlemap : medi.hospital.location_zs ,location : medi.hospital.location_zs ,claims: claim, netpay: medi.charge - claim < 0 ? 0 : medi.charge - claim]}

      }
      else
      {
            jsonMap.hospital = hospital.collect{hospi ->
            return [id: hospi.id, name: hospi.name_en, location: hospi.location_en, latitude : hospi.latitude, longitude : hospi.longitude, type : hospi.type]}
            //jsonMap.medic = medic.collect{medi ->
            render jsonMap as JSON;

            //jsonMap.medic = medic.collect{medi ->
            //  return [id: medi.id, name: medi.name_en, charge: medi.charge, hospital: medi.hospital.name_en, website: medi.hospital.website , district: medi.hospital.district.name_en ,googlemap : medi.hospital.location_en ,location : medi.hospital.location_en ,claims: claim, netpay: medi.charge - claim < 0 ? 0 : medi.charge - claim]}

      }

    }

    def find_medic_interational()
    {
      HashMap jsonMap = new HashMap();
      def medic;
      if(params.purpose != '')
        medic = Medic.findByMedicType(params.purpose).list();
      else
        medic = Medic.list();
      String lang = session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE';
      if(lang.equals('zt'))
      {
          jsonMap.medic = medic.collect{medi ->
          return [id: medi.id, name: medi.name_zt, charge: medi.charge, hospital: medi.hospital.name_zt ,location : medi.hospital.location_zt, country : medi.hospital.territory.country.name_zt, flag: medi.hospital.territory.country.flag ]}
            render jsonMap as JSON;
      }
      else if(lang.equals('zs'))
      {
          jsonMap.medic = medic.collect{medi ->
          return [id: medi.id, name: medi.name_zs, charge: medi.charge, hospital: medi.hospital.name_zs, location : medi.hospital.location_zs, country : medi.hospital.territory.country.name_zs, flag: medi.hospital.territory.country.flag ]}
            render jsonMap as JSON;
      }
      else
      {
          jsonMap.medic = medic.collect{medi ->
          return [id: medi.id, name: medi.name_en, charge: medi.charge, hospital: medi.hospital.name_en , location : medi.hospital.location_en, country : medi.hospital.territory.country.name_en, flag: medi.hospital.territory.country.flag ]}
            render jsonMap as JSON;
      }


    }

    def orthopedics(){
      HashMap jsonMap = new HashMap();
      def hospital = InternationalHospital.findByMedicType('orthopedics').list();
      String lang = session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE';
      def purpose = MedicType.list();

      if(lang.equals('zt'))
      {
          render(view:'orthopedics', model:[purpose: purpose, hospitals: hospital, lang_code : 'zt']);

      }
      else if(lang.equals('zs'))
      {
          jsonMap.hospital = hospital.collect{hospi ->
          return [id: hospi.id, name: hospi.name_zs , hospital_image : hospi.image  , description :hospi.description_zs ,location : hospi.location_zs, country : hospi.country.name_zs, flag: hospi.country.flag ]}
          render(view:'orthopedics', model:[purpose: purpose, hospitals: hospital, lang_code : 'zs']);
      }
      else
      {
          jsonMap.hospital = hospital.collect{hospi ->
          return [id: hospi.id, name: hospi.name_en , hospital_image : hospi.image  , description :hospi.description_en ,location : hospi.location_en, country : hospi.country.name_en, flag: hospi.country.flag ]}
          render(view:'orthopedics', model:[purpose: purpose, hospitals: hospital, lang_code : 'en']);
      }

    }

    def oncology(){
      HashMap jsonMap = new HashMap();
      def hospital = InternationalHospital.findByMedicType('oncology').list();
      String lang = session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE';
      def purpose = MedicType.list();

      if(lang.equals('zt'))
      {
          render(view:'oncology', model:[purpose: purpose, hospitals: hospital, lang_code : 'zt']);

      }
      else if(lang.equals('zs'))
      {
          jsonMap.hospital = hospital.collect{hospi ->
          return [id: hospi.id, name: hospi.name_zs , hospital_image : hospi.image  , description :hospi.description_zs ,location : hospi.location_zs, country : hospi.country.name_zs, flag: hospi.country.flag ]}
          render(view:'oncology', model:[purpose: purpose, hospitals: hospital, lang_code : 'zs']);
      }
      else
      {
          jsonMap.hospital = hospital.collect{hospi ->
          return [id: hospi.id, name: hospi.name_en , hospital_image : hospi.image  , description :hospi.description_en ,location : hospi.location_en, country : hospi.country.name_en, flag: hospi.country.flag ]}
          render(view:'oncology', model:[purpose: purpose, hospitals: hospital, lang_code : 'en']);
      }

    }

    def aesthetic_surgery(){
      HashMap jsonMap = new HashMap();
      def hospital = InternationalHospital.findByMedicType('aesthetic surgery').list();
      String lang = session.'org.springframework.web.servlet.i18n.SessionLocaleResolver.LOCALE';
      def purpose = MedicType.list();

      if(lang.equals('zt'))
      {
          render(view:'aesthetic_surgery', model:[purpose: purpose, hospitals: hospital, lang_code : 'zt']);

      }
      else if(lang.equals('zs'))
      {
          jsonMap.hospital = hospital.collect{hospi ->
          return [id: hospi.id, name: hospi.name_zs , hospital_image : hospi.image  , description :hospi.description_zs ,location : hospi.location_zs, country : hospi.country.name_zs, flag: hospi.country.flag ]}
          render(view:'aesthetic_surgery', model:[purpose: purpose, hospitals: hospital, lang_code : 'zs']);
      }
      else
      {
          jsonMap.hospital = hospital.collect{hospi ->
          return [id: hospi.id, name: hospi.name_en , hospital_image : hospi.image  , description :hospi.description_en ,location : hospi.location_en, country : hospi.country.name_en, flag: hospi.country.flag ]}
          render(view:'aesthetic_surgery', model:[purpose: purpose, hospitals: hospital, lang_code : 'en']);
      }

    }


}
