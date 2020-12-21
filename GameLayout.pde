class GameLayout {

  Ball ball = new Ball(width/2, height/2, 5 * (width/800), random(-1, 1), 20 * (height/500)); 
  Paddle player = new Paddle(width / 40, height/2, height / 5, 5 * ( height / 500), true);
  Paddle opp = new Paddle(width - width / 40, ball.posy, height / 5, 5 * ( height / 500), false);


  void update(GameSession g) {
    player.update();
    if (g.twoplayer) {
      opp.update();
    } else {
      opp.comp(ball);   //Die KI wird nur berechnet, wenn es keinen Spieler 2 gibt
    }
    ball.update(g);
  }

  void display() {
    player.display();        //Spieler I wird generiert und bewegt
    opp.display();      //Spieler II wird generiert und bewegt
    ball.display(); //Ball wird generiert und bewegt
  }
}
