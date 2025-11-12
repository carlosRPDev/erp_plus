import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["overlay", "modal"]

  connect() {
    console.log("✅ Modal de soporte conectado")
  }

  open() {
    const overlay = document.querySelector('[data-erp-core--support-modal-target="overlay"]')
    const modal = document.querySelector('[data-erp-core--support-modal-target="modal"]')
    if (!overlay || !modal) return console.error("No se encontró modal")

    overlay.classList.remove("hidden")
    setTimeout(() => {
      modal.classList.remove("opacity-0", "scale-95")
      modal.classList.add("opacity-100", "scale-100")
    }, 10)
  }

  close() {
    const overlay = document.querySelector('[data-erp-core--support-modal-target="overlay"]')
    const modal = document.querySelector('[data-erp-core--support-modal-target="modal"]')
    if (!overlay || !modal) return console.error("No se encontró modal")

    modal.classList.remove("opacity-100", "scale-100")
    modal.classList.add("opacity-0", "scale-95")
    setTimeout(() => overlay.classList.add("hidden"), 200)
  }
}
