package wireframe

class Territory {
  String name_en;
  String name_zt;
  String name_zs;

    static constraints = {
      name_en();
      name_zt();
      name_zs();
    }

    static hasMany = [hospitals: Hospital, districts : District]
    static belongsTo = [country : Country];
    String toString(){
      return this.name_en;
    }

    static namedQueries = {
        findByCountry { String _country ->
            country {
                eq "name_en", _country
            }

        }

}

}
