import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['form', 'input', 'contracts'];

  connect() {
    console.log(this.formTarget);
    console.log(this.inputTarget);
    console.log(this.contractsTarget);
  }
}