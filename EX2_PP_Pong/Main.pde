final int SCREENX = 600;
final int SCREENY = 400;
final int PADDLEHEIGHT = 15;
final int PADDLEWIDTH = 50;
final int MARGIN = 10;
      int i = SCREENX/2;                // middle x point of the screen


Player thePlayer;
Player computerPlayer;
Ball theBall;


void settings() 
{
  size(SCREENX, SCREENY);
}

void setup() 
{
  thePlayer = new Player(SCREENY-PADDLEHEIGHT-2);
  computerPlayer = new Player(0);
  theBall = new Ball();
  ellipseMode(RADIUS);
}

void draw() 
{
  background(0);
  thePlayer.move(mouseX);            // !! move paddle dependent on ball relative to middle of the paddle 
  if (theBall.x < i)                 // ball on left half of computer paddle
  {
   i -= 3; 
    computerPlayer.move(i--);        // move left 
  } 
  else 
  {
    i += 3;
    computerPlayer.move(i++);       // move right
  }
  
  theBall.move();
  
  theBall.collide(thePlayer);
  theBall.collide(computerPlayer);
  
  theBall.reset();
  
  thePlayer.livesLeft();
  computerPlayer.livesLeft();
  
  thePlayer.draw();
  computerPlayer.draw();
  theBall.draw();
  
  textSize(20);
  fill(250,204,38);
  text("Opponent's lives: " + computerPlayer.lives, 15, 50);
  if (computerPlayer.lives < 0)
  {
    computerPlayer.lives = 3;
  }
  if (thePlayer.lives <0)
  {
    thePlayer.lives = 3;
  }
  
  
  textSize(20);
  fill(250,204,38);
  text("Your lives: " + thePlayer.lives, 15, 75);
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
  
  theBall.dx = random(2, 3); 
  theBall.dy = random(2, 3);
}
