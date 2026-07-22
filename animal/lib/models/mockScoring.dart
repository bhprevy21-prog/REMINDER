import 'scoring.dart';

class MockScoring {
  Scoring mockScoringData() {
    final scoring = Scoring();

    scoring.addScore(35, 20);
    scoring.addScore(15, 30);
    scoring.addScore(25, 18);
    scoring.addScore(40, 32);
    scoring.addScore(12, 15);
    scoring.addScore(18, 10);
    scoring.addScore(22, 28);
    scoring.addScore(30, 26);

    return scoring;
  }
}