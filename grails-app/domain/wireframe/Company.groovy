package wireframe

class Company {

  String name_en;
  String name_zt;
  String name_zs;

    static hasMany = [plans : Plan, hospitals : Hospital, international : InternationalHospital]
    static belongsTo = [Hospital, InternationalHospital];
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
}
