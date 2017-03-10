import java.util.*;
Particle [] Starfield;
void setup()
{
  size(500,500);
  background(0);
  Starfield = new Particle[1000];
  
  for(int i= 0; i < Starfield.length; i++){
    Starfield[i] = new NormalParticle();
  }
  Starfield[998] = new OddballParticle();
  Starfield[999] = new JumboParticle();
}
void draw()
{
  background(0);
  for(int i= 0; i < Starfield.length; i++){
   Starfield[i].move();
   Starfield[i].show();
  }      
}
class NormalParticle implements Particle
{
  double posX = 250;
  double posY = 250;
  double speed = random(5);
  double angle = Math.PI * 2 * Math.random();
  int color1 = 100; 
  int color2 = 150;
  int color3 = 250;
  int direction = 0; 
  
  NormalParticle(){
  
  }
  
  public void move(){    
    
    
    if (mousePressed)
  {
    if(mouseX > posX)
    {
      posX = posX+ 1;
    }
    if(mouseX < posX)
    {
      posX = posX - 1;
    }
    if (mouseY > posY)
    {
      posY = posY + 1;
    }
    if(mouseY < posY)
    {
     posY = posY - 1;
    }
    
  }
  else
    {
    if(posX >= 500 || posY >= 500){
      direction = 1;
    }
    else if(posX <= 0 || posY <= 0){
       direction = 0;
    }
    if(direction == 1){
      posX -=  (Math.cos(angle) *speed);
      posY -= (Math.sin(angle) * speed);
      }
     else if(direction == 0){
       posX +=  (Math.cos(angle) * speed);
       posY += (Math.sin(angle) * speed);
    }
  } 
  } 
  public void show(){
    fill(color1,color2,color3,(random(150)+100));
    ellipse((int)posX,(int)posY,10,10);
  }
}
interface Particle
{
  public void show();
  public void move();
  
}
class OddballParticle implements Particle
{
  double oddX = 235;
  double oddY = 235;
  double speed = random(25);
  double angle = Math.PI * 2 * Math.random();
  int color1 = (int) random(250);
  int color2 = (int) random(250);
  int color3 = (int) random(250);
  int direction = 0;
  
  OddballParticle(){

  }
  
  public void move(){
   
     if (mousePressed)
  {
    if(mouseX > oddX)
    {
      oddX = oddX + 1;
    }
    if(mouseX < oddX)
    {
      oddX = oddX- 1;
    }
    if (mouseY > oddY)
    {
      oddY = oddY + 1;
    }
    if(mouseY < oddY)
    {
     oddY = oddY - 1;
    }
    
  }
  else 
    {
    if(oddX >= 500 || oddY >= 500){
      direction = 1;
    }
    else if(oddX <= 0 || oddY <= 0){
       direction = 0;
    }
    if(direction == 1){
      angle = Math.PI * 2 * Math.random();
      speed = random(25);
      oddX -=  (Math.cos(angle) * speed);
      oddY -= (Math.sin(angle) * speed);
      }
     else if(direction == 0){
       angle = Math.PI * 2 * Math.random();
       speed= random(25);
       oddX +=  (Math.cos(angle) * speed);
       oddY += (Math.sin(angle) * speed);
    }
  } 
  } 
  public void show(){
    fill(color1,color2,color3);
    rect((int)oddX,(int)oddY,40,40);
  }
  
}
class JumboParticle extends NormalParticle
{        
  public void show(){
    fill(247,107,12);
    ellipse((int)posX,(int)posY,70,70);
  }
    
}
