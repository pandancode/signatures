import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form', 'input', 'contracts'];

  update() {
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    console.log(url)
    console.dir(this.contractsTarget)
    fetch(url, { headers: { 'Accept': 'text/plain' } })
    .then(response => response.text())
    .then((data) => { 
      console.log(data)
      this.contractsTarget.innerHTML = data
    })
  }
}