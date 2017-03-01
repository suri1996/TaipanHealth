package wireframe

class ScanController {

    def index() { }

    def body_part() {
      render(view: 'body_part')
    }

    def bone() {
      render(view: 'bone')
    }

    def organ() {
      render(view: 'organ')
    }

    def other() {
      render(view: 'other')
    }
}
