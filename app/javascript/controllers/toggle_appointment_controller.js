import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"];

  toggleForm(e) {
    e.preventDefault();
    this.formTarget.classList.toggle("d-none");

    // border: 1px solid white;
    // padding: 40px;
    // background-color: white;
    // border-radius: 8px;
  }
}
