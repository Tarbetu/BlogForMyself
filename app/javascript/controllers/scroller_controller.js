import { Controller } from "@hotwired/stimulus"

// Mostly taken from this link: 
// https://github.com/gorails-screencasts/infinite-scroll-stimulus-js/blob/master/app/javascript/controllers/infinite_scroll_controller.js
// Thanks for GoRails :)
// Connects to data-controller="scroller"
export default class extends Controller {
  static targets = ["posts", "pagy"]

  connect() {
    Rails
  }
}
