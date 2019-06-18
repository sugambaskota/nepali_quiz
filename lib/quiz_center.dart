import 'package:nepali_quiz/question_model.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question('बि.स.१९९२ को एस एलसी परिक्षा मा १९ जना पास भएका थिए।', true),
    Question('अदुवा उत्पादनमा नेपाल बिश्वोको चौथो स्थानमा पर्छ।', true),
    Question('इस्ट टिमोर युरोप महादेशमा पर्दछ।', false),
    Question('चेस खेलको सुरु भारत देशबाट भएको हो।', true),
    Question(
        'चादिको मोहर चलनचल्तिमा ल्याउने मल्ल राजा भुपतिन्द्र मल्ल हुन।', false),
    Question('रारा ताल मुगु जिल्लामा पर्छ।', true),
    Question('क्षेत्रफलको हिसाबले तेस्रो ठूलो महादेश अन्टार्कटिका हो।', false),
    Question(
        'बिश्वको कुल क्षेत्रफलको ०.०३ प्रतिशत भूभाग नेपालले ओगटेको छ।', true),
    Question(
        'एसिया को कुल क्षेत्रफलको ०.३ प्रतिशत भूभाग नेपालले ओगटेको छ।', true),
    Question('नेपाल को सबै भन्दा होचो भूभाग झापा जिल्लको केचनाकवल हो।', true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void resetCounter() {
    _questionNumber = 0;
  }
}
