void gameinfo() {
  // life info
  String s = str(ball.life);
  fill(255); // color:white
  textSize(20);
  text("life ", 5, height-10);
  text(s, 40, height-10);
  noFill();
  
  // score info
  String t = str(ball.score);
  fill(255); // color:white
  textSize(20);
  text("score ", 80, height-10);
  text(t, 145, height-10);
  noFill();
}
