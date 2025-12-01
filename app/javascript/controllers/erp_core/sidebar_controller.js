import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["label", "logo", "icon", "item", "iconWrapper"]
  static values = {
    expandedClass: String,
    collapsedClass: String
  }

  connect() {
    // Restaurar estado expandido/colapsado
    this.expanded = JSON.parse(localStorage.getItem("sidebar-expanded") ?? "true")

    // Restaurar ítem activo guardado
    this.activeItem = localStorage.getItem("sidebar-active-item")

    this.applyState()
    this.applyActiveItem()
  }

  applyState() {
    this.element.classList.add("transition-all", "duration-300", "ease-in-out")

    if (this.expanded) {
      this.element.classList.add(this.expandedClassValue)
      this.element.classList.remove(this.collapsedClassValue)
      this.showLabels()
    } else {
      this.element.classList.add(this.collapsedClassValue)
      this.element.classList.remove(this.expandedClassValue)
      this.hideLabels()
    }
  }

  toggle() {
    this.expanded = !this.expanded

    // Guardar estado expandido
    localStorage.setItem("sidebar-expanded", JSON.stringify(this.expanded))

    this.applyState()
    this.iconTarget.classList.toggle("rotate-180")

    // ➤ Emitir evento para actualizar el layout
    window.dispatchEvent(new CustomEvent("sidebar:state", {
      detail: { expanded: this.expanded }
    }))
  }

  showLabels() {
    this.labelTargets.forEach(el => {
      el.classList.remove("opacity-0", "pointer-events-none")
      el.classList.add("opacity-100")
    })

    // Íconos alineados a la izquierda cuando está expandido
    this.iconWrapperTargets.forEach(w => {
      w.classList.remove("justify-center")
      w.classList.add("justify-start")
    })
  }

  hideLabels() {
    this.labelTargets.forEach(el => {
      el.classList.add("opacity-0", "pointer-events-none")
      el.classList.remove("opacity-100")
    })

    // Íconos centrados cuando está colapsado
    this.iconWrapperTargets.forEach(w => {
      w.classList.add("justify-center")
      w.classList.remove("justify-start")
    })
  }


  switch(event) {
    // Eliminar color activo previo
    this.itemTargets.forEach(item => {
      item.classList.remove("text-orange-600", "font-semibold")
    })

    // Agregar color al ítem clickeado
    event.currentTarget.classList.add("text-orange-600", "font-semibold")

    // Guardarlo en localStorage
    localStorage.setItem("sidebar-active-item", event.currentTarget.href)
  }

  applyActiveItem() {
    if (!this.activeItem) return

    this.itemTargets.forEach(item => {
      if (item.href === this.activeItem) {
        item.classList.add("text-orange-600", "font-semibold")
      } else {
        item.classList.remove("text-orange-600", "font-semibold")
      }
    })
  }
}
