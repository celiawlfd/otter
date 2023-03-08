import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-review"
export default class extends Controller {
  static targets = ["reviews", "form", "average", "stars"]
  connect() {
    // console.log(this.element)
    // console.log(this.reviewsTarget)
    // console.log(this.formTarget)
  }

  send(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json"},
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        if (data.review) {
          this.itemsTarget.insertAdjacentHtml("afterstart", data.review)
          this.formTarget.outerHTML = data.form
          this.averageTarget.outerHTML = data.average
          this.starsTarget.outerHTML = data.stars
        }
      })
  }
}
