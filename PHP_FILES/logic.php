<?php
	header('Content-Type: text/html; charset=utf-8');
	header('Access-Control-Allow-Origin: *');
	header("Content-Type: application/json");
	//response.setHeader("Set-Cookie", "HttpOnly;Secure;SameSite=None");
	setlocale(LC_TIME, 'de_DE', 'deu_deu');
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);

  include 'config.php';
	include './model/message.php';
	include './model/evaluation.php';
	include './model/question.php';

	$postdata = file_get_contents("php://input");
	$request = json_decode($postdata);


    switch (isset($request->command) ? $request->command : "") {
		case "getQuestions":
			echo getQuestions($pdo, $request->user);

            break;

		case "getUser":

			echo getUser($pdo, $request->user);

			break;

		case "updateDatabase":

			echo updateDatabase($pdo, $request->user, $request->answerID, $request->userInput);

			break;

		case "getEvaluation":

			echo getEvaluation($pdo);

			break;

		case "finishedSurvey":
			echo finishedSurvey($pdo, $request->user);

			break;

            default:
			$m = new Message();
			$m->success = false;
			$m->errorMessage = "Unbekannte Anweisung!";
		  echo json_encode($m, JSON_UNESCAPED_UNICODE);
            break;
        }

		// prüft ob ein User bereits in der Datenbank hinterlegt ist und legt gegebenenfalls einen neuen User an
		function getUser($pdo, $user){
			$m = new Message();
			$m->success = false;

			if (isset($user)) {
				$statement = $pdo->prepare("SELECT * FROM USERS WHERE USER_ID = :un");
				$statement->execute(array('un' => $user));
				while($row = $statement->fetch()) {
					$m->success = true;
					break;
				}
				if (!$m->success) {
					$statement = $pdo->prepare("INSERT INTO USERS (USER_ID) VALUES ( :user )");
					$statement->bindParam(':user', $user);
					$statement->execute();
					$m->errorMessage = "Neuer User eingeloggt." . $user;
				}
			} else {
				$m->errorMessage = "Bitte loggen Sie sich ein!";
			}
			return json_encode($m, JSON_UNESCAPED_UNICODE);
		}


		// liest alle Fragen und Antworten aus der Datenbank aus
        function getQuestions($pdo, $user){

			$m = new Message();
			$sql = "SELECT * FROM questions";

			foreach ($pdo->query($sql) as $row) {
				$question = new Question();
				$question->questionText = $row['QUESTION_TEXT'];

				$sql2 = "SELECT * FROM ANSWERS INNER JOIN ANSWER_TYPE ON ANSWERS.ANSWER_TYPE_ID = ANSWER_TYPE.ANSWER_TYPE_ID WHERE QUESTION_ID = ".$row['QUESTION_ID']." AND REF_ANSWER IS NULL";
				$answers = array();
				foreach ($pdo->query($sql2) as $row2) {
				$answer = new Answer();
				$answer->answerText = $row2['ANSWER_TEXT'];
        $answer->answerId = $row2['ANSWER_ID'];
        $answer->answerType = $row2['ANSWER_TYPE_NAME'];

					$sql3 = "SELECT * FROM ANSWERS INNER JOIN EVAULATION ON ANSWERS.ANSWER_ID=EVAULATION.ANSWER_ID WHERE ANSWERS.ANSWER_ID=".$row2['ANSWER_ID']." AND EVAULATION.USER_ID = '".$user."'";
					if ($pdo->query($sql3)->rowCount() > 0) {

						// Diese Antwort wurde von dem Nutzer ausgewählt
		        $answer->answered = true;

						$sql4 = "SELECT * FROM ANSWERS  INNER JOIN ANSWERS AS ref_answers ON ANSWERS.ANSWER_ID = ref_answers.REF_ANSWER INNER JOIN ANSWER_TYPE ON ref_answers.ANSWER_TYPE_ID = ANSWER_TYPE.ANSWER_TYPE_ID  WHERE ref_answers.Ref_Answer = ".$row2['ANSWER_ID']." ORDER BY ref_answers.ANSWER_ID ";
						if ($pdo->query($sql4)->rowCount()>0) {
              $refAnswers = array();
							// Es gibt Referenzierte Antworten
						  $answer->hasRefAnswers = true;
							foreach ($pdo->query($sql4) as $row3) {
								$refAnswer = new Answer();
								$refAnswer->answerText = $row3['ANSWER_TEXT'];
								$refAnswer->answerId = $row3['ANSWER_ID'];
								$refAnswer->answerType = $row3['ANSWER_TYPE_NAME'];

								$sql5 = "SELECT * FROM ANSWERS INNER JOIN EVAULATION ON ANSWERS.ANSWER_ID=EVAULATION.ANSWER_ID WHERE ANSWERS.ANSWER_ID=".$row3['ANSWER_ID']." AND EVAULATION.USER_ID = '".$user."'";
								if ($pdo->query($sql5)->rowCount() > 0) {
									//Wenn der User die Fragen bereits ausgewertet hat
									$refAnswer->answered = true;
									foreach ($pdo->query($sql5) as $row4) {
									$refAnswer->userInput = $row4['USER_INPUT'];
								}
							}
							$refAnswers[] =$refAnswer;
							}
								$answer->refAnswers = $refAnswers;
						}
					}
					$answers[]=$answer;
				}
					$question->answers=$answers;
			  	$m->myList[] = $question;
			}

				return json_encode($m, JSON_UNESCAPED_UNICODE);
			}

			function updateDatabase($pdo, $user, $answer_id, $user_input){
				$m = new Message();

				$sql = "SELECT * FROM ANSWERS WHERE answer_id = $answer_id";
				foreach ($pdo->query($sql) as $row) {
					$qID = $row['QUESTION_ID'];
					$aTypeID = $row['ANSWER_TYPE_ID'];
					$aRef = $row['REF_ANSWER'];

					switch ($aTypeID) {
						//radio
						case 1:
							if($aRef == null){
							$statement2 = $pdo->prepare("SELECT * FROM EVAULATION INNER JOIN ANSWERS ON EVAULATION.answer_id = ANSWERS.answer_id WHERE EVAULATION.user_id = ? AND ANSWERS.question_id = ?");
							$statement2->execute(array($user, $qID));
							while($row2 = $statement2->fetch()) {
							$statement3 = $pdo->prepare("DELETE FROM EVAULATION WHERE EVALUATION_ID = ?");
							$statement3->execute(array($row2['EVALUATION_ID']));
							}
							$statement = $pdo->prepare("INSERT INTO EVAULATION (answer_id, user_id) VALUES (?, ?)");
							$statement->execute(array($answer_id, $user));
							$m->errorMessage = "radio" . $aTypeID;
						} else {
							$statement2 = $pdo->prepare("SELECT * FROM EVAULATION INNER JOIN ANSWERS ON EVAULATION.answer_id = ANSWERS.answer_id WHERE EVAULATION.user_id = ? AND ANSWERS.question_id = ? AND ANSWERS.REF_ANSWER = ANSWERS.REF_ANSWER");
							$statement2->execute(array($user, $qID));
							while($row2 = $statement2->fetch()) {
							$statement3 = $pdo->prepare("DELETE FROM EVAULATION WHERE EVALUATION_ID = ?");
							$statement3->execute(array($row2['EVALUATION_ID']));
							}
							$statement = $pdo->prepare("INSERT INTO EVAULATION (answer_id, user_id) VALUES (?, ?)");
							$statement->execute(array($answer_id, $user));
						}


						break;

						//text
						case 2:
							$statement2 = $pdo->prepare("SELECT * FROM EVAULATION WHERE EVAULATION.USER_ID = '".$user."' AND EVAULATION.ANSWER_ID = ".$answer_id."");
							$statement2->execute(array($user, $answer_id));
							while($row2 = $statement2->fetch()) {
							$statement3 = $pdo->prepare("DELETE FROM EVAULATION WHERE EVALUATION_ID = ?");
							$statement3->execute(array($row2['EVALUATION_ID']));
							}
							$statement = $pdo->prepare("INSERT INTO EVAULATION (answer_id, user_id, USER_INPUT) VALUES (?, ?, ?)");
							$statement->execute(array($answer_id, $user, $user_input));

							$m->errorMessage = "radio" . $aTypeID;

						break;

						//checkbox
						case 3:
							$sql = "SELECT * FROM EVAULATION WHERE EVAULATION.USER_ID = '".$user."' AND EVAULATION.ANSWER_ID = ".$answer_id."";
								if ($pdo->query($sql)->rowCount() > 0) {
									$statement3 = $pdo->prepare("DELETE FROM EVAULATION WHERE EVAULATION.USER_ID = ? AND EVAULATION.ANSWER_ID = ?");
									$statement3->execute(array($user, $answer_id));
								}
								else {
									$statement = $pdo->prepare("INSERT INTO EVAULATION (answer_id, user_id) VALUES (?, ?)");
									$statement->execute(array($answer_id, $user));
								}

						$m->errorMessage = "check" . $aTypeID;

						break;

						default:
						$m->success = false;
						$m->errorMessage = "unbekannter Answer Type" . $aTypeID;
					break;
										}

				}
				return json_encode($m, JSON_UNESCAPED_UNICODE);
			}

			function finishedSurvey($pdo, $user){
				$m = new Message();

				$a = -999;
				$b = -888;

				$statement = $pdo->prepare("SELECT COUNT(DISTINCT ANSWERS.QUESTION_ID) AS evaluationAmount FROM EVAULATION INNER JOIN ANSWERS ON ANSWERS.ANSWER_ID=EVAULATION.ANSWER_ID WHERE user_id = ?");
				$statement->execute(array($user));

				while($row = $statement->fetch()) {
					$a = $row['evaluationAmount'];
				}

				$statement = $pdo->prepare("SELECT COUNT(DISTINCT question_id) AS questionAmount FROM QUESTIONS");
				$statement->execute();
				while($row = $statement->fetch()) {
					$b = $row['questionAmount'];
				}

				if ($a == $b) {
					$m->success = true;
				}else {
					$m->success = false;
				}

				return json_encode($m, JSON_UNESCAPED_UNICODE);
			}


			function getEvaluation($pdo){
				$m = new Message();

				$statement = $pdo->prepare("SELECT questions.QUESTION_TEXT, questions.QUESTION_ID from questions");
				$statement->execute();

        // wähle alle Fragen aus
				while($row=$statement->fetch()){
          $question = new Question();
          $question->questionText = $row['QUESTION_TEXT'];
        	$question->questionId = $row['QUESTION_ID'];

        	$answers = array();

				$statement2 = $pdo->prepare("SELECT questions.QUESTION_TEXT, questions.QUESTION_ID, answers.ANSWER_TEXT, COUNT(evaulation.ANSWER_ID) AS 'answer_count', answers.ANSWER_TYPE_ID, answers.ANSWER_ID from answers inner join questions on questions.QUESTION_ID=answers.QUESTION_ID left outer join evaulation on answers.ANSWER_ID = evaulation.ANSWER_ID WHERE questions.QUESTION_ID = ". $row['QUESTION_ID'] ." group by answers.ANSWER_ID");
				$statement2->execute();

				while($row2=$statement2->fetch()){
				$evaluation = new EVALUATION();

				$evaluation->answerText = $row2['ANSWER_TEXT'];
        $evaluation->answerCount = $row2['answer_count'];

					if($row2['ANSWER_TYPE_ID']==2){

						$statement3 = $pdo->prepare("SELECT USER_INPUT from evaulation WHERE ANSWER_ID = ". $row2['ANSWER_ID'] );
						$statement3->execute();
						$myUserInput=array();

						while($row3=$statement3->fetch()){
							$myUserInput[] = $row3['USER_INPUT'];
						}
            $evaluation->userInput = $myUserInput;
					}
          $answers[] = $evaluation;
                  $question->evaluation = $answers;

				}
        $questions[] = $question;
			}
				$m->myList = $questions;
				$m->success = true;

				return json_encode($m, JSON_UNESCAPED_UNICODE);
			}



?>
