import { Controller } from "@hotwired/stimulus"

import ClipboardJS from "clipboard"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
