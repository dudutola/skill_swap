import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="home-button"
export default class extends Controller {
  static targets = ["linkText"];

  connect() {
    this.setLinkText("Enter", "/");
    this.autoChangeText();
  }

  setLinkText(text, url) {
    this.linkTextTarget.textContent = text;
    this.linkTextTarget.closest('a').setAttribute('href', url);
  }

  autoChangeText() {
    setInterval(() => {
      const currentText = this.linkTextTarget.textContent;
      if (currentText === "Enter") {
        this.setLinkText("Sign Up", "/users/sign_up");
      } else if (currentText === "Sign Up") {
        this.setLinkText("Sign In", "/users/sign_in");
      } else if (currentText === "Share Skill") {
        this.setLinkText("Sign In", "/users/sign_in");
      } else if (currentText === "Learn more") {
        this.setLinkText("Sign In", "/users/sign_in");
      } else {
        this.setLinkText("Enter", "/");
      }
    }, 2000);
  }
}
