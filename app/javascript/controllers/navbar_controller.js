import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ['menu', "dark", "btn"]
  connect() {
  }

  open() {
    this.btnTargets.forEach(btn => {
      btn.classList.toggle("d-none");
    });
    const cta = document.querySelector('#cta-btn');
    if (cta) {
      cta.classList.toggle("d-none");
    }
    if (this.menuTarget.classList.contains("d-none")) {
      this.menuTarget.classList.remove("d-none");
      this.darkTarget.classList.remove('d-none');
      this.menuTarget.classList.replace("close", "open");
    } else {
      this.menuTarget.classList.replace("open", "close");
      this.darkTarget.classList.add('d-none');
      setTimeout(() => {
        this.menuTarget.classList.add("d-none")
      }, 290);
    }
  }
}
