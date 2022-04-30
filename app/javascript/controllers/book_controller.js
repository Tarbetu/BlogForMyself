import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="book"
export default class extends Controller {
  connect() {
    this.#blockRightClick();
    this.#blockCopy();
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
        Kara Tilki Hiyerarşi'ni bu şekilde kopyalamayacağınızı söylemek durumundayım.
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
