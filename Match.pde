class Match {
  int winner=-1;
  int round;
  int[] playerInputs=new int[2];
  int[] players={-1, -1};
  Match(boolean inputs, int p1, int p2, int _round) {
    if(inputs) {
      playerInputs[0]=p1;
      playerInputs[1]=p2;
    } else {
      players[0]=p1;
      players[1]=p2;
    }
    round=_round;
  }
  void updateMatch() {
    if(winner==-1) {
      
    }
  }
  int getWinner() { return winner; }
}
