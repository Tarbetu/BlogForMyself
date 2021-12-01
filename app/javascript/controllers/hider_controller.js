import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hider"
export default class extends Controller {
  static targets = ["self"]

  connect() {
    setTimeout(() => {
      this.close()
    }, 5000)
  }

  close() {
    this.selfTarget.classList.add("hidden")
  }
}
