package wireframe

class Plan {

  String name_en;
  String name_zt;
  String name_zs;
  Float claim;


    static belongsTo = [company : Company];
    static hasMany = [medictypes : MedicType, medics : Medic];


    static mapping = {

        version false
    }

    static constraints = {
      name_en();
      name_zt();
      name_zs();
      claim();
    }

    String toString(){
      return this.name_en;
    }
}
