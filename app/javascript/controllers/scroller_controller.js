import { Controller } from "@hotwired/stimulus"

// Mostly taken from this link: 
// https://github.com/gorails-screencasts/infinite-scroll-stimulus-js/blob/master/app/javascript/controllers/infinite_scroll_controller.js
// Thanks for GoRails :)
// Connects to data-controller="scroller"
export default class extends Controller {
  static targets = ["posts", "pagy"]
  static values  = { page: Number }

  // İşin yoksa fetch yaz :(
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
      if (this.increasePageIndex()) {
        this.loadMore(url)
      }
    }
  }

  loadMore(url) {
    const args = {
      method: "GET",
      headers: {
        "Accept": "application/json"
      }
    }
    fetch(url, args)
      .then((data) => data.json())
      .then((json) => {
        this.postsTarget.insertAdjacentHTML("beforeend", json.posts)
        this.pagyTarget.innerHTML = json.pagy
      })
  }

  // It might raise a problem
  increasePageIndex() {
    const active = this.pagyTarget.querySelector(".active")
    this.pageValue++
    if (active.textContent >= this.pageValue) return false
    return true
  }
}
