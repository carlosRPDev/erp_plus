import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["target"]

  connect() {
    this.observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry, index) => {
          if (entry.isIntersecting) {
            setTimeout(() => {
              entry.target.classList.remove("opacity-0", "translate-y-10")
              entry.target.classList.add("opacity-100", "translate-y-0")
            }, index * 150)
          } else {
            entry.target.classList.remove("opacity-100", "translate-y-0")
            entry.target.classList.add("opacity-0", "translate-y-10")
          }
        })
      },
      { threshold: 0.1 }
    )

    this.targetTargets.forEach((el) => this.observer.observe(el))
  }

  disconnect() {
    if (this.observer) this.observer.disconnect()
  }
}
