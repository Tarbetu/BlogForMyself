import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["menu"]

  connect() {
    console.log("Hey!")
  }

  // Toggles the navigation menu for mobile
  toggleMenu() {
    ["hidden", "flex"] => this.menuTarget.classList.toggle(i)
  }
}
