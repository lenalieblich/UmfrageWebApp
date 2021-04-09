import {Component, HostListener, OnInit} from '@angular/core';
import {AuthService} from '../../services/auth-service.service';
import * as uuid from 'uuid';
import {Message} from '../../model/message';
import {Answer, Question} from '../../model/question';
import {Router} from '@angular/router';


@Component({
  selector: 'app-questions',
  templateUrl: './questions.component.html',
  styleUrls: ['./questions.component.css']
})
export class QuestionsComponent implements OnInit {
  progress: number;
  index = 0;
  questionsArray: Question[];
  arrayLength: number;
  userId: any;
  textValue = '';
  hidden = true;

  constructor(private authServ: AuthService, private router: Router) {
    if (localStorage.getItem('token') !== null) {
      // falls schon ein token vorhanden ist
      this.userId = localStorage.getItem('token');
    } else {
      this.userId = uuid.v4();
      this.loginUser();
    }
  }

  ngOnInit() {
    this.getQuestions();
    this.allAnswered();
  }

  loginUser() {
    const response = JSON.stringify({command: 'getUser', user: this.userId});

    this.authServ.postUserData(response)
      .subscribe((data: any) => {
          if (data.success === false) {
            localStorage.setItem('LoggedIn', 'true');
            localStorage.setItem('token', this.userId);
          } else {
            console.log(response);
          }
        }
      );
  }

  getQuestions() {
    const response = JSON.stringify({command: 'getQuestions', user: this.userId});
    this.authServ.postUserData(response)
      .subscribe((data: any) => {
          if (data.success === true) {
            this.questionsArray = data.myList;
            this.arrayLength = this.questionsArray.length;
            const percent = 100 / this.arrayLength;
            this.progress = Math.round((this.index + 1) * percent);
          } else {
            console.log(response);
          }
        }
      );
  }


  @HostListener('document:keypress', ['$event'])
  handleKeyboardEvent(event: KeyboardEvent) {
    if (event.key === 'Enter') {
      this.nextPage();
    }
  }

  nextPage() {
    if (this.arrayLength > this.index + 1) {
      this.index = this.index + 1;
      this.getQuestions();
    } else {
      this.index = 0;
      this.getQuestions();
    }
    this.allAnswered();
  }

  prevPage() {
    if (this.index > 0) {
      this.index = this.index - 1;
      this.getQuestions();
    } else {
      this.index = this.arrayLength - 1;
      this.getQuestions();
    }
    this.allAnswered();
  }

  selectedAnswer(answer: any, userInput: string) {
    if (userInput === null) {
      this.textValue = '';
    } else {
      this.textValue = userInput;
    }

    const response = JSON.stringify({command: 'updateDatabase', user: this.userId, answerID: answer, userInput: this.textValue});
    // console.log(response);
    this.authServ.postUserData(response)
      .subscribe((data: any) => {
          // console.log(data);
          this.getQuestions();
          this.allAnswered();
        }
      );
  }

  allAnswered() {
    const response = JSON.stringify({command: 'finishedSurvey', user: this.userId});
    this.authServ.postUserData(response)
      .subscribe((data: any) => {
          if (data.success === true) {
            this.hidden = false;
          } else {
            this.hidden = true;
          }
        }
      );
  }

  submitSurvey() {
    localStorage.clear();
    this.router.navigate(['/start']);
  }

}
