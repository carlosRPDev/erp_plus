import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  switch(event) {
    const links = this.element.querySelectorAll("a")
    links.forEach(l => l.classList.remove("text-orange-500"))
    event.currentTarget.classList.add("text-orange-500")
  }
}
