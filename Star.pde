public class Star {
  private int myX, myY, myColor, mySize;
  public Star(){
    myX = (int)(Math.random()*600);
    myY = (int)(Math.random()*600);
    myColor = (int)(Math.random()*255);
    mySize = (int)(Math.random()*5);
  }
  public void show(){
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }
}
