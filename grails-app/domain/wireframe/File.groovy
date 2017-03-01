package wireframe

class File {
    static belongsTo = [product : Product]
    String name;
    String url;
    static constraints = {
      name();
      url();
    }
    String toString(){
      return name;
    }
}
