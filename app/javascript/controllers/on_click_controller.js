import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="on-click"
export default class extends Controller {
  static targets=['modal', 'overlay']
  connect() {
  }

  addModal() {
    this.modalTarget.classList.remove("d-none")
  }

  removeModal() {
    this.modalTarget.classList.add("d-none")
  }

  addOverlay() {
    this.overlayTarget.classList.remove("display-none")
  }

  removeOverlay() {
    this.overlayTarget.classList.add("display-none")
  }
}
