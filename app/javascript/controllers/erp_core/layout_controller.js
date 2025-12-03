import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    const expanded = JSON.parse(localStorage.getItem("sidebar-expanded") ?? "true")
    this.updateLayout(expanded)

    window.addEventListener("sidebar:state", (e) => {
      this.updateLayout(e.detail.expanded)
    })
  }

  updateLayout(expanded) {
    this.element.classList.add("transition-all", "duration-300", "ease-in-out")

    if (expanded) {
      this.element.classList.add("md:ml-56")
      this.element.classList.remove("md:ml-20")
    } else {
      this.element.classList.add("md:ml-20")
      this.element.classList.remove("md:ml-56")
    }
  }
}
