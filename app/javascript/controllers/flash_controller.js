import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
  setTimeout(() => {
    this.element.classList.remove("translate-x-full")
  }, 120);


  setTimeout(() => {
    this.element.classList.add("translate-x-full")
  }, 3500);
  }

}
