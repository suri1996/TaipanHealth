package wireframe
import java.security.MessageDigest;

class Users {

    String title;
    String email;
    String password;
    String name;
    String phone;
    String country;
    Boolean isConfirm;
    String validationCode;

    static mapping = {
        members sort: 'firstName', order: 'asc'
        version false
    }

    def beforeInsert(){
        encodePassword()
    }

    def beforeUpdate(){
        //encodePassword()
    }

    def encodePassword(){
       MessageDigest md5Digest;
       byte[] digest;

       md5Digest = MessageDigest.getInstance("SHA-512");
       md5Digest.reset();
       md5Digest.update(password.getBytes());
       digest = md5Digest.digest();
       password = new BigInteger(1,digest).toString(16)
    }

    static hasMany = [members: Member]

    static constraints = {
        email unique: true
        password(password: true)

    }

    String toString()
    {
      return email;
    }

}
