package wireframe

class District {

    String name_en;
    String name_zt;
    String name_zs;

    static belongsTo = [territory : Territory];
    static hasMany = [hospitals: Hospital];

    static constraints = {
      name_en();
      name_zt();
      name_zs();
    }

    String toString(){
      return this.name_en;
    }

}
