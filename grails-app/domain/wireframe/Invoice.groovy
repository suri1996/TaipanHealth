package wireframe

class Invoice {
    static belongsTo = [member: Member]
    static hasMany = [products : Product]
    String invoiceNo;
    String delivery_method;
    String delivery_content;
    String phone;
    Boolean isPaid;
    Date date;
    Float amount;
    String promotion_code;
    String question;
    static constraints = {
      invoiceNo();
      phone(nullable: true)
      promotion_code(nullable: true)
    }

    static mapping = {
    sort "invoiceNo", "asc"
    products sort: 'name', order: 'asc'
}
}
