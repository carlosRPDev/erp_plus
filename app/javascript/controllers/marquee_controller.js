// app/javascript/controllers/marquee_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item"]

  connect() {
    this.track = this.element
    this.paused = false
    this.speed = 30 // px/seg

    this.prepareContent()

    this.start()

    window.addEventListener('resize', this._onResize = this.onResize.bind(this))

    this.track.addEventListener('mouseenter', () => (this.paused = true))
    this.track.addEventListener('mouseleave', () => (this.paused = false))
  }

  // 🧩 NUEVO: duplicar items en el track
  prepareContent() {
    const items = Array.from(this.itemTargets)

    let totalWidth = this.track.scrollWidth
    const requiredWidth = window.innerWidth * 3

    let i = 0
    while (totalWidth < requiredWidth) {
      const clone = items[i % items.length].cloneNode(true)
      this.track.appendChild(clone)
      totalWidth = this.track.scrollWidth
      i++
    }
  }

  start() {
    requestAnimationFrame(() => {
      this.totalWidth = this.track.scrollWidth / 2
      this.offset = 0
      this.last = performance.now()
      this.rafId = requestAnimationFrame(this.step.bind(this))
    })
  }

  step(now) {
    if (!this.last) this.last = now

    if (!this.paused) {
      const dt = now - this.last
      this.offset += (this.speed * dt) / 1000

      if (this.offset >= this.totalWidth) {
        this.offset -= this.totalWidth
      }

      this.track.style.transform = `translateX(${-this.offset}px)`
    }

    this.last = now
    this.rafId = requestAnimationFrame(this.step.bind(this))
  }

  onResize() {
    cancelAnimationFrame(this.rafId)

    // limpiar duplicados previos (opcional)
    // ⚠️ Solo si tu contenido está generado en el servidor
    // this.track.innerHTML = originalHTML

    this.prepareContent()
    this.start()
  }

  disconnect() {
    cancelAnimationFrame(this.rafId)
    window.removeEventListener('resize', this._onResize)
  }
}
