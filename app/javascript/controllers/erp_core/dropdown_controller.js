import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]

  connect() {
    document.addEventListener("click", this.hide.bind(this))
    // 1️⃣ Leer estado inicial guardado por el sidebar
    const expanded = JSON.parse(localStorage.getItem("sidebar-expanded") ?? "true")
    this.updateNavbar(expanded)

    // 2️⃣ Escuchar evento emitido por el sidebar
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
      // Sidebar expandido (w-56)
      this.element.classList.add("md:ml-56")
      this.element.classList.remove("md:ml-20")

      this.element.classList.add("md:w-[calc(100%-14rem)]")
      this.element.classList.remove("md:w-[calc(100%-5rem)]") // 20 = 5rem
    } else {
      // Sidebar colapsado (w-20)
      this.element.classList.add("md:ml-20")
      this.element.classList.remove("md:ml-56")

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
