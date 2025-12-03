import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["text", "links", "image"]

  connect() {
    [this.textTarget, this.linksTarget, this.imageTarget].forEach(el => {
      el.classList.add("scale-90", "opacity-0")
      el.classList.add("transition-transform", "transition-opacity", "duration-1500", "ease-out")
    })

    setTimeout(() => this.animate(this.textTarget), 200)
    setTimeout(() => this.animate(this.linksTarget), 500)
    setTimeout(() => this.animate(this.imageTarget), 800)
  }

  animate(el) {
    el.classList.remove("scale-90", "opacity-0")
    el.classList.add("scale-100", "opacity-100")
  }
}
