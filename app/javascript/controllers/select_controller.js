import { Controller } from "@hotwired/stimulus"
import Choices from "choices.js";

// Connects to data-controller="select"
export default class extends Controller {
  static targets = [ "input" ]

  connect() {
    this.inputTarget.choices = new Choices(this.inputTarget)
  }

  destroy() {
    this.inputTarget.choices.destroy()
  }
}
