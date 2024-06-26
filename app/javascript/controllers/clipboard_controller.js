import { Controller } from "@hotwired/stimulus"

import ClipboardJS from "clipboard"

export default class extends Controller {
  static values = {
    successMessage: { type: String, default: "Copied!" },
    failureMessage: { type: String, default: "Failed to copy!" },
  }

  connect() {
    this.clipboard = new ClipboardJS(this.element)

    this.clipboard.on("success", (e) => {
      this.element.setAttribute("data-clipboard-text", e.text)
      this.element.setAttribute("data-clipboard-success", "")
      this.element.setAttribute("data-clipboard-failure", "")
  }
}
