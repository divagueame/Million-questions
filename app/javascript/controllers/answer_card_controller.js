import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer-card"
export default class extends Controller {
  static targets = [ "answerInput", "form", "answerSubmit", "layover", "question"]
  initialize() {
  // this.element.classList.remove('opacity-100')
  }
 
  connect() {
    this.answerInputTarget.focus();  
  }

  validate(e){ 
    if(!this.answerInputTarget.value.length){
      this.answerInputTarget.classList.add('invalid-text-input');
      setTimeout(() => {
        this.answerInputTarget.classList.remove('invalid-text-input')
      }, 750);

    } else {
      
      document.getElementById("progress").progress.update()

      this.answerSubmitTarget.disabled = true;
      this.answerSubmitTarget.value = 'Next...'
      this.answerSubmitTarget.classList.add('hover:bg-emerald-400')
      this.answerSubmitTarget.classList.add('bg-emerald-500')
      
      setTimeout(() => {
        Turbo.navigator.submitForm(e.target)  
      }, 1000);
      
    }
  }

}
