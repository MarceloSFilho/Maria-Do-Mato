import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="on-hover"
export default class extends Controller {
  static targets=['infos']

  connect() {
  }

  revealContent() {
    this.infosTarget.classList.remove("d-none")
  }

  addContent() {
    this.infosTarget.classList.add("d-none")
  }
}
