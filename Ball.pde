//import ddf.minim.*; // minimライブラリのインポート
//Minim minim;
class Ball {
  float x; // x座標
  float y; // y座標
  int r; // ボールの半径
  int life = 2; // 残機
  int score = 0; // 点数
  
  // ボールの方向
  int x_direction = 1;
  int y_direction = 1;
  
  // ボールの速さ
  float x_speed = 2.45;
  float y_speed = 3.0;
  
  // コンストラクタ
  Ball(float xpos, float ypos, int rad, int l, int p) {
    x = xpos;
    y = ypos;
    r = rad;
    life = l;
    score = p;
  }
  
  // 描画関数
  void display() {
    x = x + (x_speed * x_direction);
    y = y + (y_speed * y_direction);
    
    // 跳ね返らせるように方向を変える
    if(x > width-r || x < r) {
      x_direction *= -1;
      sound_effect2();
    }
    if(y < r) {
      y_direction *= -1;
      sound_effect2();
    }
    
    // 画面下, ラケットで跳ね返せなかった場合lifeを減らす
    if(y > height-r) {
      life -= 1;
      // lifeがまだ残っているなら生成する
      ball = new Ball(200, 200, 10, life, score);
      sound_effect3();
    }
    
    // ボールを描画する
    fill(255);
    ellipse(x, y, r, r);
    noFill();
  }
  
}
