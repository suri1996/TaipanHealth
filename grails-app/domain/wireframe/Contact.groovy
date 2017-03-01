package wireframe

class Contact {

    String name;
    String email;
    String phone;
    String message;
    Date date;

    static mapping = {
        version false
    }

    static constraints = {
      date();
      email();
      name();
      phone();
      message();
    }
}
