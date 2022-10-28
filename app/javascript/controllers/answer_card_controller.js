import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer-card"
export default class extends Controller {
  static targets = [ "answerInput", "form", "answerSubmit", "layover", "question"]
  initialize() {
  // this.element.classList.remove('opacity-100')
  }
 
  connect() {
    this.answerInputTarget.focus(); 
    
    // progress_bar_identifier
    setTimeout(() => {
      // this.element.classList.remove('opacity-0');
      // this.element.classList.add('opacity-100')
      // this.element.classList.add('bg-green-100')
    }, 1800);
  }

  validate(e){
    
    if(!this.answerInputTarget.textLength){
      e.preventDefault();
      this.answerInputTarget.classList.add('invalid-text-input');
      
      setTimeout(() => {
        this.answerInputTarget.classList.remove('invalid-text-input')
      }, 750);

    } else {
      e.preventDefault();
      
      document.getElementById("progress").progress.update()

      this.answerSubmitTarget.disabled = true;
      this.answerSubmitTarget.value = 'Next...'
      this.answerSubmitTarget.classList.remove('bg-blue-600')
      this.answerSubmitTarget.classList.remove('hover:bg-blue-600')
      this.answerSubmitTarget.classList.add('bg-emerald-500')
      this.answerSubmitTarget.classList.add('hover:bg-emerald-400')
      this.layoverTarget.classList.add('translate-y-0')
      // this.questionTarget.classList.add('opacity-0');
      
      // this.answerInputTarget.classList.add('scale-x-100')
      setTimeout(() => {
        // this.answerInputTarget.classList.remove('scale-x-100')
        // this.answerInputTarget.classList.add('scale-x-0')
        // this.answerInputTarget.parent().classList.remove('w-full')
        // this.answerInputTarget.parentElement.classList.add('w-0')
        // this.answerInputTarget.classList.add('px-0')
        // console.log(this.answerInputTarget.parentElement)
      }, 500);

      setTimeout(() => {
        Turbo.navigator.submitForm(e.target)  
      }, 1000);
      
      
      // e.target.requestSubmit(this.answerSubmitTarget)
      // this.answerSubmitTarget.click()
      
    }
  }

}
