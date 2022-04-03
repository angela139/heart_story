public class Explosion
{

  private double myX, myY, mySpeed, myAngle;
  private int myColor;

  public Explosion(int x, int y)
  {
    myX = x;
    myY = y;
    mySpeed = (Math.random()*25)+20;
    myAngle = (Math.random())*2*Math.PI;
    myColor = color(255, 0, 0);
  }

  public void move()
  {
    myX = myX + mySpeed*Math.cos(myAngle);
    myY = myY + mySpeed*Math.sin(myAngle);
  }
  
  public void show()
  {
    noStroke();
    fill(myColor);
    ellipse((int)myX, (int)myY, 6, 6);
  }
}
