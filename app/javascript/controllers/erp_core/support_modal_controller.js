import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["overlay", "modal"]

  connect() {
    console.log("✅ Modal de soporte conectado")
  }

  open() {
    console.log("🟠 Abriendo modal")
    this.overlayTarget.classList.remove("hidden")
    setTimeout(() => {
      this.modalTarget.classList.remove("opacity-0", "scale-95")
      this.modalTarget.classList.add("opacity-100", "scale-100")
    }, 10)
  }

  close() {
    console.log("🔵 Cerrando modal")
    this.modalTarget.classList.remove("opacity-100", "scale-100")
    this.modalTarget.classList.add("opacity-0", "scale-95")
    setTimeout(() => {
      this.overlayTarget.classList.add("hidden")
    }, 200)
  }
}
