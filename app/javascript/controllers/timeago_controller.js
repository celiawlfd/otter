import { Controller } from "@hotwired/stimulus"
import Timeago from 'stimulus-timeago'

// Connects to data-controller="timeago"
export default class extends Controller {
  connect() {
    console.log("helloooo")
  }
}
