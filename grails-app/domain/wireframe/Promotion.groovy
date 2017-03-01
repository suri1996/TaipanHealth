package wireframe

class Promotion {
    String code;
    Boolean isUsed;
    Date valid_til;
    Integer discount_rate;
    String invoice_no;
    static constraints = {
      code();
      invoice_no(nullable : true);
      code(unique: true);
    }
}
