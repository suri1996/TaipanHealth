package wireframe

class Country {

  String name_en;
  String name_zt;
  String name_zs;
  String flag;

    static constraints = {
      name_en();
      name_zt();
      name_zs();
      flag();
    }

    String toString(){
      return this.name_en;
    }

    static hasMany = Territory;


}
