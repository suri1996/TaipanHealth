package wireframe

class MedicType {
  String name_en;
  String name_zt;
  String name_zs;
//      static belongsTo = [plan : Plan];
      static hasMany = [medics : Medic, hospital: Hospital, internationalHospitals : InternationalHospital ,plans: Plan];
      static belongsTo = [Hospital, Plan, InternationalHospital];

      String toString(){
        return this.name_en;
      }

    static constraints = {
      name_en();
      name_zt();
      name_zs();
    }




}
