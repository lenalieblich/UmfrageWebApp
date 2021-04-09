<?php

	class Question {
	   public $questionText = "";
	   public $answers = array();
	}

	class Answer {
	   public $answerText = "";
	   public $answerType = "";
     public $answerId = 0;
     public $hasRefAnswers = false;
     public $refAnswers = array();
     public $answered = false;
     public $userInput = "";
	}



?>
