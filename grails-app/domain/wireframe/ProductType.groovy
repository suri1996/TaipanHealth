package wireframe


class ProductType {
    static hasMany = [productLists : ProductList]
    String name_en;
    String name_zt;
    String name_zs;
    static constraints = {
      name_en();
      name_zt();
      name_zs();
    }
    static mapping = {
      productLists sort: 'name_en', order : 'asc'
    }
    String toString(){
      return name_en;
    }
}
