class Racket {
  int x, y; // ラケットのx,y座標
  int x_len, y_len; // ラケットの長さ、太さ
  //float hit_point = 100; // ラケットの強度
  
  // コンストラクタ
  Racket(int xpos, int ypos, int xlen, int ylen) {
    x = xpos;
    y = ypos;
    x_len = xlen;
    y_len = ylen;
  }
  
  // ラケットの長さに関する関数
  void bar_length() {
    x_len -= 5;
  }
  
  // 当たり判定の関数
  void hit_hantei() {
    // block上部
    if((ball.x > x && ball.x < x+x_len)
        && (ball.y > y-ball.r && ball.y < y)) {
          ball.y_direction *= -1;
          sound_effect4();
          bar_length();
    }
    
    // block下部
    if((ball.x > x && ball.x < x+x_len)
        && (ball.y < y+y_len+ball.r && ball.y > y+y_len)) {
          ball.y_direction *= -1;
          sound_effect4();
          bar_length();
    }
    
    // block左
    if((ball.x < x && ball.x > x-ball.r)
        && (ball.y > y && ball.y < y+y_len)) {
          ball.x_direction *= -1;
          sound_effect4();
          bar_length();
    }
    
    // block右
    if((ball.x > x+x_len && ball.x < x+x_len+ball.r)
        && (ball.y > y && ball.y < y+y_len)) {
          ball.x_direction *= -1;
          sound_effect4();
          bar_length();
    }
  }
  
  void display() {
    fill(255);
    rect(x, y, x_len, y_len); // 四角形の描画
    hit_hantei();
    noFill();
  }
  
}
