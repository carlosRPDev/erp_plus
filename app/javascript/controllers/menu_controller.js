import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  toggle() {
    this.menuTarget.classList.toggle("hidden")
    const icon = this.element.querySelector("i")
    icon.classList.toggle("fa-bars")
    icon.classList.toggle("fa-times")
  }
}
