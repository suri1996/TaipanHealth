package wireframe

class Product {


    String name;
    String price;
    static constraints = {
    }
    static belongsTo = [invoice: Invoice]
    String toString(){
      return name;
    }

}
