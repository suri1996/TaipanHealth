package wireframe

class Medic {

  String name_en;
  String name_zt;
  String name_zs;
  Float charge;

    static belongsTo = [Hospital,  Plan, MedicType, InternationalHospital];
    static hasMany = [plans: Plan];
    static hasOne = [hospital : Hospital , medictypes : MedicType, internationalhospitals : InternationalHospital];
    static mapping = {
        version false
    }

    static constraints = {
      name_en();
      name_zt();
      name_zs();
    }

    String toString(){
      return this.name_en;
    }

    static namedQueries = {
        findByMedicTypeAndPlan { String typeName, String _plan ->
            medictypes {
                eq "name_en", typeName
            }
            plans{
              eq "name_en", _plan
            }
            order 'charge', 'asc'
        }

        findByMedicType{
          String typeName ->
          medictypes {
              eq "name_en", typeName
          }

        }
    }


}
