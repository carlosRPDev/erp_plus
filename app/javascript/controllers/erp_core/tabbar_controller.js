import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item"]

  switch(event) {
    this.itemTargets.forEach(item => {
      item.classList.remove("text-orange-600", "font-semibold")
    })

    event.currentTarget.classList.add("text-orange-600", "font-semibold")

    localStorage.setItem("sidebar-active-item", event.currentTarget.href)
  }
}
