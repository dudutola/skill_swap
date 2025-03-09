// app/javascript/controllers/toggle_controller.js
import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
//   static targets = ["content"];

//   toggle(event) {
//     const targetId = event.currentTarget.dataset.target;
//     this.contentTargets.forEach((content) => {
//       if (content.id === targetId) {
//         content.classList.toggle("d-none");
//       } else {
//         content.classList.add("d-none");
//       }
//     });
//   }
// }

export default class extends Controller {
  static targets = ["issuesContent", "appointmentsContent", "issuesHeader", "appointmentsHeader"];

  toggle(e) {
    const value = e.currentTarget.getAttribute("data-value");

    // 1 way to do it
    // const isIssues = value === "issues";
    // // if value === "issues"
    // // save the result in a variable
    // // then .toggle("d-none", result)

    // this.issuesTarget.classList.toggle("d-none", !isIssues);
    // this.appointmentsTarget.classList.toggle("d-none", isIssues);

    // another way to do it
    // if (e.currentTarget.getAttribute("data-value") === "issues") {
    //   this.issuesTarget.classList.toggle("d-none");
    //   this.appointmentsTarget.classList.add("d-none");
    // }
    // if (e.currentTarget.getAttribute("data-value") === "appointments") {
    //   this.appointmentsTarget.classList.toggle("d-none");
    //   this.issuesTarget.classList.add("d-none");
    // }

    if (value === "issues") {
      this.issuesHeaderTarget.classList.add("underline");
      this.issuesContentTarget.classList.remove("d-none");

      this.appointmentsContentTarget.classList.add("d-none");
      this.appointmentsHeaderTarget.classList.remove("underline");
    }
    if (value === "appointments") {
      this.issuesContentTarget.classList.add("d-none");
      this.issuesHeaderTarget.classList.remove("underline");

      this.appointmentsContentTarget.classList.remove("d-none");
      this.appointmentsHeaderTarget.classList.add("underline");
    }
  }
}
