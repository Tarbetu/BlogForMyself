import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="book"
export default class extends Controller {
  static targets = ["index"];

  connect() {
    this.#blockRightClick();
    this.#blockCopy();
  }

  toggleIndex() {
    this.indexTarget.classList.toggle("hidden");
  }

  #blockRightClick() {
    document.addEventListener("contextmenu", (event) => {
      event.preventDefault();
    });
  }

  #blockCopy() {
    document.addEventListener("copy", (event) => {
      event.clipboardData.setData(
        "text/plain",
        `
        Özrünüzü isteyerekten,
        Kara Tilki Hiyerarşi'ni bu şekilde kopyalamayacağınızı bildiriyorum.
        Elbette kopyalamanın bazı yolları var, ama siteden olduğu gibi alıp kopyalayamazsınız.
        Paylaşmak isterseniz; istediğiniz kısmı ve niyetinizi anlatan kısa bir mail atın, size direkt kendim yollayayım.
        emrecansuster@outlook.com
        emrecansuster@tuta.io
      `
      );
      event.preventDefault();
    });
  }
}
