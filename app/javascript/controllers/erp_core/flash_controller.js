import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["message"]

  connect() {
    console.log("✅ Flash cards errors and notices conectado")
    this.messageTargets.forEach((el, index) => {
      setTimeout(() => {
        el.classList.remove("translate-x-full", "opacity-0")
        el.classList.add("translate-x-0", "opacity-100")
      }, index * 150)

      setTimeout(() => this.hide(el), 5000 + index * 200)
    })
  }

  hide(el) {
    el.classList.remove("translate-x-0", "opacity-100")
    el.classList.add("-translate-x-full", "opacity-0")
    setTimeout(() => el.remove(), 500)
  }
}
