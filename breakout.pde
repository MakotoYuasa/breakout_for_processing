Racket racket;
Ball ball;
Block[] block;
HardBlock[] hardblock;

void setup() {
  size(400,500); // 画面サイズ
  noStroke();
  
  racket = new Racket(200, 450, 100, 10);
  ball = new Ball(200, 190, 10, 3);
  
  // blockの準備
  int block_x = 60, block_y = 10;
  block = new Block[11];
  block[0] = new Block(120, 10, block_x, block_y);
  block[1] = new Block(220, 10, block_x, block_y);
  //block[2] = new Block(20, 60, block_x, block_y);
  block[2] = new Block(120, 60, block_x, block_y);
  block[3] = new Block(220, 60, block_x, block_y);
  //block[4] = new Block(320, 60, block_x, block_y);
  block[4] = new Block(20, 120, block_x, block_y);
  block[5] = new Block(120, 120, block_x, block_y);
  block[6] = new Block(220, 120, block_x, block_y);
  block[7] = new Block(320, 120, block_x, block_y);
  block[8] = new Block(70, 160, block_x, block_y);
  block[9] = new Block(170, 160, block_x, block_y);
  block[10] = new Block(270, 160, block_x, block_y);
  
  // 耐久力が2のblock
  hardblock = new HardBlock[2];
  hardblock[0] = new HardBlock(20, 60, block_x, block_y);
  hardblock[1] = new HardBlock(320, 60, block_x, block_y);
  
  /* BGM再生に関するプログラム */
  minim = new Minim(this); // 初期化
  
  /* BGM 気に入った方をコメントアウトを消して使う */
  
  //player = minim.loadFile("cycloop.mp3");
  player = minim.loadFile("action8.mp3");
  player.play(); // 再生する
}

// 描画関数
void draw() {
  background(40); // 背景色:黒
  
  racket.display();
  
  for(int i=0; i<block.length; i++) {
    if(block[i].hit_point > 0) { 
      block[i].display();
    }
  }
  
  if(ball.life > 0) ball.display();
  
  for(int j=0; j<hardblock.length; j++) {
    if(hardblock[j].hit_point > 0) { 
      hardblock[j].display();
    }
  }
  
  gameinfo();
}

void stop() {
  player.close();
  minim.stop(); 
  super.stop();
}

// キーが入力された時の関数
void keyPressed() {
  if(key == CODED) {
    switch(keyCode) {
      case LEFT:
        if(racket.x > 0) racket.x -= 16;
        break;
      case RIGHT:
        if(racket.x + racket.x_len < width) racket.x += 16;
        break;
       /*
      case RETURN:
        //ボールに速度を与える
        ball.x = 2;
        ball.y = 5;
        break;
      */
    }
  }
}
