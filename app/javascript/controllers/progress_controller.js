import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="progress"
export default class extends Controller {

  static targets = ["bar", "counter"]

  static values = { answered: Number, questions: Number }

  answeredValueChanged() {
    let percentage = (this.answeredValue -1 )/ this.questionsValue;
    
    if(percentage===0){ percentage = 0.015 }
    percentage = percentage * 100
    this.barTarget.style.width = `${percentage}%`;
    if(this.answeredValue <= this.questionsValue){
      console.log('Lower!')
      this.counterTarget.innerText = this.answeredValue
    }
  }

  connect() {
    this.element[this.identifier] = this; 
  }
  update() { 
    this.answeredValue++
  }
}
