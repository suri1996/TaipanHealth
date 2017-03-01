package wireframe

class InternationalHospital {

    String name_en;
    String name_zt;
    String name_zs;
    String location_en;
    String location_zt;
    String location_zs;
    String description_en;
    String description_zt;
    String description_zs;
    String image;
    String website;
    //district, territory

    static constraints = {
      name_en();
      name_zt();
      name_zs();
      location_en();
      location_zt();
      location_zs();
      image();
      website();
      description_en();
      description_zt();
      description_zs();
      country();
    }

    static hasMany = [medictypes : MedicType, medics : Medic, companies : Company]
    static belongsTo = [country: Country]

    static namedQueries = {
      findByMedicType { String type ->
          medictypes {
              eq "name_en", type
          }
      }

    }

}
