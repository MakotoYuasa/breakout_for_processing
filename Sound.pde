import ddf.minim.*; // minimライブラリのインポート
Minim minim;
AudioPlayer player;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;

// ボールがブロックや壁に当たったときの効果音
void sound_effect2() {
  player2 = minim.loadFile("bound.mp3");
  player2.play(); // 再生する
}

// ボールが落下したときの効果音
void sound_effect3() {
  player3 = minim.loadFile("out.mp3");
  player3.play(); // 再生する
}

// ラケットの当たったときの効果音
void sound_effect4() {
  player4 = minim.loadFile("racket.mp3");
  player4.play(); // 再生する
}
