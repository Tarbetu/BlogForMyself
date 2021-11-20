import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="editor"
export default class extends Controller {
  static targets = [ "newCategoryMenu" ]
  toggleMenu() {
    this.newCategoryMenuTarget.classList.toggle("hidden")
  }
}
