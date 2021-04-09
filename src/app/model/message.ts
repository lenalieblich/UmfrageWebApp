import {Question} from './question';

export interface Message {
  errorMessage: string;
  myList: Question[];
  success: boolean;
}
