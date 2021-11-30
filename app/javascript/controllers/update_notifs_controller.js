import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['notif-number'];

  connect() {
    console.log(this.element);
    console.log(this.itemsTarget);
    console.log(this.formTarget);
  }
}
