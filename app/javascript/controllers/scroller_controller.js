import { Controller } from "@hotwired/stimulus"

// Mostly taken from this link: 
// https://github.com/gorails-screencasts/infinite-scroll-stimulus-js/blob/master/app/javascript/controllers/infinite_scroll_controller.js
// Thanks for GoRails :)
// Connects to data-controller="scroller"
export default class extends Controller {
  static targets = ["posts", "pagy"]

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

    if (window.pageYOffset >= height - window.innerHeight - 100) {
      this.loadMore(url)
      this.scrollToUp()
    }
  }

  // To remove duplication, we scroll to a bit upper.
  // Feels weird, but it's the most simple way
  scrollToUp() {
    const wantedPosition = window.pageYOffset - 100
    window.scrollTo(window.pageXOffset, wantedPosition)
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
}
