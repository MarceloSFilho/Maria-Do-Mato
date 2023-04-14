import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="on-click"
export default class extends Controller {
  static targets=['edit', 'input', 'update']
  connect() {
  }
}
