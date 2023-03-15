import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-formlist"
export default class extends Controller {
  static targets = ['divform', 'form', 'btn']

  connect() {
  }

  showform() {
    this.btnTarget.classList.add('d-none')
    this.divformTarget.classList.remove('d-none')
  }

  hideform(event) {
    // console.log(event)
  //   if (event['target'][2]['value'] != "") {
  //     console.log(event['target'][2]['value'] != "")
  //     this.divformTarget.classList.add('d-none')
  //   } else {
  //     console.log(this.divformTarget.classList)
  //     this.divformTarget.classList.remove('d-none')
  //     this.divformTarget.outerHTML = this.divformTarget
  //   }
  }
}
