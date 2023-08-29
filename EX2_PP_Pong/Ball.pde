class Ball {
  float x; 
  float y;
  float dx; 
  float dy;
  int radius;
  color ballColor = color(81,237,207);
  
  Ball() 
  {
    x = random(SCREENX/4, SCREENX/2);
    y = random(SCREENY/4, SCREENY/2);
    dx = random(2, 3);                   // speed/direction of ball 
    dy = random(2, 3);
    radius=15;
  }
  
  void move() 
  {
    x = x+dx; 
    y = y+dy;
  }
  
  void draw() 
  {
    fill(ballColor);
    ellipse(int(x), int(y), radius, radius);
  }
  
  void collide(Player tp) 
  {
    if (x-radius <=0 && dx < 0) dx=-dx;                            // collision with side walls
    else if (x+radius>=SCREENX && dx > 0) dx=-dx;
    if (y+radius >= tp.ypos && y-radius<tp.ypos+PADDLEHEIGHT       // collision with paddles
          && x >=tp.xpos && x <= tp.xpos+PADDLEWIDTH)              
      {
      println("collided!");
      dy=-dy;
    }
  }

  void reset() 
  {

    if (y - radius >= SCREENY)                                     // ball goes down
    {  
      thePlayer.lives--;
    }
    if (y + radius <= 0)                                           // ball goes up
    {  
      computerPlayer.lives--;    
    }
    if (y - radius >= SCREENY || y + radius <= 0)                 // either player scores
      {
      x = random(SCREENX/4, SCREENX/2);                           // ball returned static in the middle of the screen
      y = random(SCREENY/4, SCREENY/2);
      dx = 0; 
      dy = 0;
    }

    
    
  }
  
  void mousePressed() 
  {
    if (thePlayer.lives == 0 || computerPlayer.lives == 0 )
    {
      thePlayer.lives = 3;
      computerPlayer.lives = 3;
      theBall.x = random(SCREENX/4, SCREENX/2);
      theBall.y = random(SCREENY/4, SCREENY/2);
      theBall.dx = 0; 
      theBall.dy = 0;
    }
  
    theBall.dx = random(1, 2); 
    theBall.dy = random(1, 2);
  }
}
