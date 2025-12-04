import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["label", "logo", "icon", "item"]
  static values = {
    expandedClass: String,
    collapsedClass: String
  }

  connect() {
    this.expanded = JSON.parse(localStorage.getItem("sidebar-expanded") ?? "true")

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

    localStorage.setItem("sidebar-expanded", JSON.stringify(this.expanded))

    this.applyState()
    this.iconTarget.classList.toggle("rotate-180")

    window.dispatchEvent(new CustomEvent("sidebar:state", {
      detail: { expanded: this.expanded }
    }))
  }

  showLabels() {
    this.labelTargets.forEach(el => {
      el.classList.remove("opacity-0", "pointer-events-none", "w-0")
      el.classList.add("opacity-100")
    })
  }

  hideLabels() {
    this.labelTargets.forEach(el => {
      el.classList.add("opacity-0", "pointer-events-none", "w-0")
      el.classList.remove("opacity-100")
    })
  }


  switch(event) {
    this.itemTargets.forEach(item => {
      item.classList.remove("text-orange-600", "font-semibold")
    })

    event.currentTarget.classList.add("text-orange-600", "font-semibold")

    localStorage.setItem("sidebar-active-item", event.currentTarget.href)
  }

  applyActiveItem() {
    const rubyActive = this.itemTargets.find(item =>
      item.classList.contains("text-orange-600")
    )

    if (!rubyActive) return

    localStorage.setItem("sidebar-active-item", rubyActive.href)
  }
}
