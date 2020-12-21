class Ball {

  float posx, posy, speedx, speedy, size;

  Ball(float x, float y, float sx, float sy, float size) {
    this.posx = x;
    this.posy = y;
    this.speedx = sx;
    this.speedy = sy;
    this.size = size;
  }

  void update(GameSession g) {
    posx = posx + speedx;
    posy = posy + speedy;
    collision(g);
  }

  ////////////////////////////////////////

  void display() {
    ellipse(posx, posy, size, size);
  }

  /////////////////////////////////////////

  void collision(GameSession g) {
    if (posy >= height - (size / 2) - 1)
    {
      speedy = (-speedy);
      posy = height - (size/2);
    }  //Kollision Wand Unten
    if (posy <= size / 2) 
    {
      speedy = (-speedy);
      posy = (size / 2) + 1;
    }
    // Kollision Wand Unten. Es gilt Einfallswinkel = Ausfallswinkel
    
    if (
      posx <= g.game.player.posx + ((g.game.player.size / 10) * 2) && 
      posx >= width/80 && 
      posy - size / 2 <= (g.game.player.posy + g.game.player.size / 2 + g.game.player.size/15) && 
      posy >= (g.game.player.posy - g.game.player.size / 2 - g.game.player.size/15))
    {
      speedx = (-speedx) + ((g.tollerance / 15) * 2);
      speedy = speedy - (g.game.player.posy - posy) * 0.06;
      posx = posx + speedx/10;
      posy = posy + speedy/10;
      g.runde = g.runde + 1; 
      //Kollisionsabgrage des Balls an das Brett des Spielers
    } else if (
      posx >= width - ((g.game.opp.size / 10) * 2) - width / 40 && 
      posx <= width - width / 80 &&
      posy - size / 2 <= (g.game.opp.posy + g.game.player.size / 2 + g.game.player.size/10) && 
      posy >= (g.game.opp.posy - g.game.player.size / 2 - g.game.player.size/10))
    {
      speedx = (-speedx) - ((g.tollerance / 15) * 2);
      speedy = speedy - (g.game.opp.posy - posy) * 0.06;    
      posx = posx + speedx/10;
      posy = posy + speedy/10;
      g.runde = g.runde + 1;
    } //Kollisionsabfrage des Balls an Spieler 2  

    if (posx < 0)
    {
      g.reset(false);
      g.op++;
    }else if (posx > width){
      g.reset(false);
      g.pp++;
    } // Punkteticker wenn der Ball den Screen hinter den Paddeln verlässt
  }
}
