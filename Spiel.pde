// Code by Luca Leuschner, use as you like

GameSession game;

void setup() {
  size(800, 600, P2D);
  frameRate(60);
  smooth(8);
  game = new GameSession();
}              

void draw() {
  game.gameLoop();
}

/////////////////////////////////////////////////////////////////////////////////////////

void keyPressed() {
  game.game.player.setInput(key, true);
  game.game.opp.setInput(keyCode, true);

  if (keyCode == UP || keyCode == DOWN) {
    game.twoplayer = true;
  } else if (key == 'r') {
    game.reset(true);
  } else if (key == 'w' || key == 's' || key == 'W' || key == 'S' || keyCode == UP || keyCode == DOWN) {
    loop();
    surface.setTitle("Pong");
  } else if (key == '1' || key == '2' || key == '3' || key == '4' || key == '5') {
    game.tollerance = int(key) - 48;
  } else if (key == ' ') {
    surface.setTitle("Press W to countinue");
    noLoop();
  }
}

///////////////////////////////////////////////////////////////////////////////////////////

void keyReleased() {
  game.game.player.setInput(key, false);
  game.game.opp.setInput(keyCode, false);
}

/////////////////////////////////////////////////////////////////////////////////
