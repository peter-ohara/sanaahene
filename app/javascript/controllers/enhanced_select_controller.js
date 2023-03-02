import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

// Connects to data-controller="enhanced-select"
export default class extends Controller {
  connect() {
    console.log("This actually got activated")
    console.log(this.element)
    const settings = {}
    new TomSelect(this.element, settings);
  }
}
