public class Heart{
  private int myX, myY;
  private int myColor;
  public Heart(){
    myX = 100;
    myY = 100;
    myColor = color(255, 0, 0);
  }
  public void show(int x, int y){
    myX = x;
    myY = y;
    stroke(255); 
    strokeWeight(1);
    push();
    translate(myX, myY);
    fill(myColor);
    beginShape();
    vertex(0, -35);
    bezierVertex(0, -55, 40, -45, 0, -10);
    vertex(0, -35);
    bezierVertex(0, -55, -40, -45, 0, -10);
    endShape();
    pop();
  }
  public int get_X(){
    return myX;
  }
  public int get_Y(){
    return myY;
  }
}
