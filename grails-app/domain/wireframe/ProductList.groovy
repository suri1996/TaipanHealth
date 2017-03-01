package wireframe

class ProductList {
    String name_en;
    String name_zt;
    String name_zs;
    Float price;
    static belongsTo = [productType : ProductType]

    static constraints = {
      name_en();
      name_zt();
      name_zs();
      price();
    }
    String toString(){
      return name_en;
    }



    static namedQueries = {
      findByProductType { String type ->
          productType {
              eq "name_en", type
          }
      }

    }


}
