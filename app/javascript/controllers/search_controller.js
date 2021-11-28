import { Controller } from 'stimulus';
export default class extends Controller {
  static targets = ["contracts", "form"]
  
  filter(event) {
    event.preventDefault()
    // console.log(this.formTarget.action)
    fetch(this.formTarget.action,{
      method: 'GET',
      headers:{'Accept': 'application/json'}
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
      })
      
  }
}