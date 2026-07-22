class Scoring {
  // Stores each round's score
  final List<({int home, int away})> scores = [];

  int _totalHomeScore = 0;
  int _totalAwayScore = 0;

  // Getters
  int get totalHomeScore => _totalHomeScore;
  int get totalAwayScore => _totalAwayScore;

  // Adds points to both teams
  void addScore(int homePoints, int awayPoints) {
    scores.add((home: homePoints, away: awayPoints));
    _totalHomeScore += homePoints;
    _totalAwayScore += awayPoints;
  }

  // Adds points only to the home team
  void addHomeScore(int homePoints) {
    addScore(homePoints, 0);
  }

  // Adds points only to the away team
  void addAwayScore(int awayPoints) {
    addScore(0, awayPoints);
  }

  // Optional helper
  void clearScores() {
    scores.clear();
    _totalHomeScore = 0;
    _totalAwayScore = 0;
  }
}