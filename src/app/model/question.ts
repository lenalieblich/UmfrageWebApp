import {AnswerEvaluation} from './evaluation';

export interface Question {
  questionText: string;
  answers: Answer[];
  evaluation: AnswerEvaluation[];
}

export interface Answer {
  answerText: string;
  answerType: string;
  answerId: number;
  hasRefAnswers: boolean;
  refAnswers: Answer[];
  answered: boolean;
  userInput: string;
}
