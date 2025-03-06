// app/javascript/controllers/toggle_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content"];

  toggle(event) {
    const targetId = event.currentTarget.dataset.target;
    this.contentTargets.forEach((content) => {
      if (content.id === targetId) {
        content.classList.toggle("d-none");
      } else {
        content.classList.add("d-none"); // Hide other sections
      }
    });
  }
}
