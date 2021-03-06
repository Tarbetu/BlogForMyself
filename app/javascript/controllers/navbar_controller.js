import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["menu"]

  // Toggles the navigation menu for mobile
  toggleMenu() {
    ["hidden", "flex"].forEach((i) => this.menuTarget.classList.toggle(i))
  }
}
