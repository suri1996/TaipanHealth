package wireframe

class Member {

  String title;
  String firstName;
  String lastName;
  Date dob;
  char gender;
  String email;
  String phone;
  String country_name_en;
  String country_name_zt;
  String country_name_zs;

  static mapping = {
      invoices sort: 'invoiceNo', order: 'asc'
      version false
  }



  static belongsTo = [user: Users]
  static hasMany = [invoices: Invoice]
    static constraints = {

    }

    String toString()
    {
      return firstName + ' ' + lastName;
    }


}
