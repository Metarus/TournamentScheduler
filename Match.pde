class Match {
  int[] playerInputs=new int[2];
  int[] players=new int[2];
  Match(boolean inputs, int p1, int p2) {
    if(inputs) {
      playerInputs[0]=p1;
      playerInputs[1]=p2;
    } else {
      players[0]=p1;
      players[1]=p2;
    }
  }
}
