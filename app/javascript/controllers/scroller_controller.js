import { Controller } from "@hotwired/stimulus"

// Mostly taken from this link: 
// https://github.com/gorails-screencasts/infinite-scroll-stimulus-js/blob/master/app/javascript/controllers/infinite_scroll_controller.js
// Thanks for GoRails :)
// Connects to data-controller="scroller"
export default class extends Controller {
  static targets = ["posts", "pagy" ]
  static values  = { page: Number }

  // For the reloading
  connect() {
    window.onload = () => {
      window.scrollTo(0,0)
    }
  }

  scrollIt() {
    const nextPage = this.pagyTarget.querySelector("a[rel='next']")
    if (nextPage == null) return
    const url = nextPage.href

    const body = document.body
    const html = document.documentElement
    const height = Math.max(
      body.scrollHeight,
      body.offsetHeight,
      html.clientHeight,
      html.scrollHeight,
      html.offsetHeight
    )

    if (window.pageYOffset >= height - window.innerHeight - 10) {
      this.loadMore(url)
    }
  }

  loadMore(url) {
    currentPage = this.pagyTarget.querySelector(".active").innerText

    const args = {
      method: "GET",
      headers: {
        "Accept": "application/json"
      }
    }
    fetch(url, args)
      .then((data) => data.json())
      .then((json) => {
        if (json.page !== currentPage) {
          this.postsTarget.insertAdjacentHTML("beforeend", json.posts)
          this.pagyTarget.innerHTML = json.pagy
        }
      })
  }
}
