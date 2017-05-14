class Block {
  int x, y; // blockの左上端の点の座標
  int x_len, y_len; // rectの横と縦の長さ
  int hit_point = 1; // 体力の数値
  
  // コンストラクタ
  Block(int xpos, int ypos, int xlen, int ylen) {
    x = xpos;
    y = ypos;
    x_len = xlen;
    y_len = ylen;
  }
   
  // 当たり判定の関数
  void hit_hantei() {
    // block上部
    if((ball.x > x && ball.x < x+x_len)
        && (ball.y > y-ball.r && ball.y < y)) {
          ball.y_direction *= -1;
          sound_effect2();
          hit_point -= 1;
    }
    
    // block下部
    if((ball.x > x && ball.x < x+x_len)
        && (ball.y < y+y_len+ball.r && ball.y > y+y_len)) {
          ball.y_direction *= -1;
          sound_effect2();
          hit_point -= 1;
    }
    
    // block左
    if((ball.x < x && ball.x > x-ball.r)
        && (ball.y > y && ball.y < y+y_len)) {
          ball.x_direction *= -1;
          sound_effect2();
          hit_point -= 1;
    }
    
    // block右
    if((ball.x > x+x_len && ball.x < x+x_len+ball.r)
        && (ball.y > y && ball.y < y+y_len)) {
          ball.x_direction *= -1;
          sound_effect2();
          hit_point -= 1;
    }
  }

  void display() {
    fill(#00FF00);
    rect(x,y,x_len,y_len);
    hit_hantei();
    noFill();
  }
  
}
