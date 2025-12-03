import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    document.addEventListener("click", this.hide.bind(this))

    const expanded = JSON.parse(localStorage.getItem("sidebar-expanded") ?? "true")
    this.updateNavbar(expanded)

    window.addEventListener("sidebar:state", (e) => {
      this.updateNavbar(e.detail.expanded)
    })
  }

  toggle() {
    this.menuTarget.classList.toggle("opacity-0")
    this.menuTarget.classList.toggle("invisible")
    this.menuTarget.classList.toggle("translate-y-2")
  }

  updateNavbar(expanded) {
    this.element.classList.add("transition-all", "duration-300", "ease-in-out")

    if (expanded) {
      this.element.classList.add("md:w-[calc(100%-14rem)]")
      this.element.classList.remove("md:w-[calc(100%-5rem)]")
    } else {
      this.element.classList.add("md:w-[calc(100%-5rem)]")
      this.element.classList.remove("md:w-[calc(100%-14rem)]")
    }
  }

  hide(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.add("opacity-0", "invisible")
    }
  }

  disconnect() {
    document.removeEventListener("click", this.hide.bind(this))
  }
}
