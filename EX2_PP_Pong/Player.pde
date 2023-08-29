class Player {
  int xpos; 
  int ypos;
  color paddlecolor = color(232,44,210);
  int lives = 3;
  
  Player(int screen_y)
  {
    xpos=SCREENX/2;
    ypos=screen_y;
  }
  
  void move(int x) 
  {
    if (x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;         // keep paddle locked in screen view 
    else xpos=x;
  }
  
  void draw()
  {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
  
  void livesLeft() 
  {
    if (lives == 0) 
    {
      if (ypos == 0) 
      {
        
        textSize(25);
        fill(97,211,92);
        text("Congrats! You won. Rematch?", 150, 200);
      } 
      else 
      {
        textSize(25);
        fill(245,84,124);
        text("Hard luck! Your opponent won. Rematch?", 120, 200);
      }
    }
  }
}
