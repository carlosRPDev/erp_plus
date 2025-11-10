// app/javascript/controllers/marquee_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.track = this.element
    this.paused = false

    // px/seg (ajusta según lo que quieras)
    this.speed = 30

    this.start()
    window.addEventListener('resize', this._onResize = this.onResize.bind(this))
    this.track.addEventListener('mouseenter', () => (this.paused = true))
    this.track.addEventListener('mouseleave', () => (this.paused = false))
  }

  start() {
    requestAnimationFrame(() => {
      // track.scrollWidth contiene el ancho total (duplicado), la mitad es el contenido original
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
        // loop suave
        this.offset -= this.totalWidth
      }

      this.track.style.transform = `translateX(${-this.offset}px)`
    }
    this.last = now
    this.rafId = requestAnimationFrame(this.step.bind(this))
  }

  onResize() {
    cancelAnimationFrame(this.rafId)
    this.start()
  }

  disconnect() {
    cancelAnimationFrame(this.rafId)
    window.removeEventListener('resize', this._onResize)
  }
}
