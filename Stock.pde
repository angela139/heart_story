public class Stock {
  private int startX, startY, endX, endY;
  private int spacer;
  public Stock(){
    startX=20;
    startY= 550;
    endX=20;
    endY=400;
    spacer = 100;
  }
  public void show(){
    strokeWeight(6);
    stroke(255);
    line(20, 10, 20, 560);
    line(20, 560, 580, 560);
    fill(255);
    textSize(14);
    text("Love Growth", 80, 20);
    text("Oct", 50, 580); 
    text("Nov", 50+spacer, 580); 
    text("Dec", 50+spacer*2, 580); 
    text("Jan", 50+spacer*3, 580);
    text("Feb", 50+spacer*4, 580); 
    text("Mar", 50+spacer*5, 580);
  }
  public void move(){
    strokeWeight(2);
    stroke(100, 205, 100);
    endX=startX+((int)Math.random()*10+1);
    if (endY > 520){
       endY=startY-((int)(Math.random()*10)+3);
      }
    else{
      endY=startY-((int)(Math.random()*19)-8);
  }
    line(startX,startY,endX,endY);
    startX=endX;
    startY=endY;
    
    
  }
  public int getX(){
    return endX;
  }
  public int getY(){
    return endY;
  }
}
