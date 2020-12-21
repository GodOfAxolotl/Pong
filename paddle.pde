class Paddle {

  float posx, posy, size, speed;
  int count, compCount;
  int rate = 15;
  boolean player, up, down, stop;
  boolean working = false;

  Paddle(final float posX, final float posY, final float size, final float speed, final boolean b) {
    this.posx = posX;
    this.posy = posY;
    this.size = size;
    this.speed = speed;
    this.player = b;
  }

  ////////////////////////////////////////////////////

  void update() {

    if (down && posy <= height - size / 2) {
      posy += speed;
    } else if (up && posy >= size / 2) {
      posy -= speed;
    }//Abfrage zur Steuerung. W for Up, S for Down
  }

  ////////////////////////////////////////////////////

  void display() {
    rect(posx, posy, size / 5, size);
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////

  void comp(Ball ball) {
    rate = 1;
    if (compCount % rate == 0 || working) {   
      if (abs(ball.speedy) > 9 && ball.posx < width / 1.2) {
        working = moveToward(height/2);
      } else if (ball.speedx < 0) {
        working = moveToward(height/2);
      } else
      {     
        working = moveToward(ball.posy);
      }
    }
    if (!working)
      compCount++;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////

  boolean moveToward(final float y) {

    if (y > posy + size / 5) {
      posy += speed;
    } else if (y < posy - size / 5) {
      posy -= speed;
    } else {
      return false; //Erledigt!
    }

    return true;
  } //Gibt true zurück wenn es noch nicht an der richtigen stelle befindet


  ////////////////////////////////////////////////////////////////////////////////////////////////////////

  void setInput(final int k, final boolean act) {

    if (player) {
      switch(k) {
      case 'w':
        up = act;
        break;
      case 's':
        down = act;
        break;
      case 'W':
        up = act;
        break;
      case 'S':
        down = act;
        break;
      default:
        
        break;
      }
    } else if (!player) {
      switch(k) {
      case UP:
        up = act;
        break;
      case DOWN:
        down = act;
        break;
      }
    }
  }
}
