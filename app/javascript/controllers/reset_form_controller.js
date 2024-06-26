import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.focusField();
  }

  reset() {
    this.element.reset();
    this.focusField();
  }

  focusField() {
    this.element.querySelector("[autofocus]")?.focus();
  }
}
