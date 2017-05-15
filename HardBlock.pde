class HardBlock extends Block {
  int hit_point = 2; // 体力の数値
  
  // コンストラクタ
  HardBlock(int xpos, int ypos, int xlen, int ylen) {
    super(xpos,ypos,xlen,ylen);
  }
  
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
    // 耐久力でブロックの色を変える
    if(hit_point == 1) fill(#43FF57);
    if(hit_point >= 2) fill(#136FFF);
    rect(x,y,x_len,y_len);
    hit_hantei();
    noFill();
  }
}
