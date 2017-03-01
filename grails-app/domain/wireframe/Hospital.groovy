package wireframe

class Hospital {
    String name_en;
    String name_zt;
    String name_zs;
    String location_en;
    String location_zt;
    String location_zs;
    String type;
    String description;
    String flag;
    String website;
    String latitude;
    String longitude;

    static mapping = {
        version false
    }

    static hasMany = [medictypes : MedicType, medics : Medic, companies : Company]
    static belongsTo = [territory : Territory, district : District, country: Country]

    static constraints = {
      name_en();
      name_zt();
      name_zs();
      location_en();
      location_zt();
      location_zs();
      type();
    }

    static namedQueries = {
        findByMedicTypeAndDistrict { String typeName, String _district ->
            medictypes {
                eq "name_en", typeName
            }
            district{
              eq "name_en", _district
            }
        }
        findByCountry { String country_name ->
            country {
                eq "name_en", country_name
            }
        }

        findByMedicType { String type ->
            medictypes {
                eq "name_en", type
            }
        }

        findByCountryAndCompany { String country_name, String insur ->
            country {
                eq "name_en", country_name
            }
            companies{
              eq "name_en", insur
            }
        }



    }

    String toString(){
      return this.name_en;
    }

}
