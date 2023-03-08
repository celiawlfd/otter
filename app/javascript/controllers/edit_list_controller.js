import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-list"
export default class extends Controller {

  static targets = ["form", "infos"]
  connect() {
    }

  displayForm() {

    this.infosTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
  }
  update(event) {
    event.preventDefault();
    const url = this.formTarget.action
    fetch(url, {
      method: "PATCH",
      headers: { 'Accept': 'text/html' },
      body: new formData(this.formTarget)
    })
    .then(response => response.text())
    .then ((data) => {
      this.element.outerHTML(data)
    })
  }
}
