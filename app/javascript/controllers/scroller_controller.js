import { Controller } from "@hotwired/stimulus";

// Mostly taken from this link:
// https://github.com/gorails-screencasts/infinite-scroll-stimulus-js/blob/master/app/javascript/controllers/infinite_scroll_controller.js
// Thanks for GoRails :)
// Connects to data-controller="scroller"
export default class extends Controller {
  static targets = ["posts", "pagy"];

  initialize() {
    this.observer = new IntersectionObserver(
      (posts) => this.processScrolling(posts),
      { rootMargin: "200px" }
    );
  }

  connect() {
    this.observer.observe(this.pagyTarget);
  }

  disconnect() {
    this.observer.unobserve(this.pagyTarget);
  }

  processScrolling(posts) {
    posts.forEach(() => {
      this.loadMore();
    });
  }

  loadMore() {
    const nextPage = this.pagyTarget.querySelector("a[rel='next']");
    if (nextPage == null) return;
    const url = nextPage.href;

    const args = {
      method: "GET",
      headers: {
        Accept: "application/json",
      },
    };

    fetch(url, args)
      .then((data) => data.json())
      .then((json) => {
        this.postsTarget.insertAdjacentHTML("beforeend", json.posts);
        this.pagyTarget.innerHTML = json.pagy;
      });
  }
}
