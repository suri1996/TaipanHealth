package wireframe

class AboutController {

    static defaultAction = "index"
    def index() {
      render(view: 'about')
    }
}
