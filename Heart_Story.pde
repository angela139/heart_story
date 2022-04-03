// Objects/Arrays of Objects/ArrayLists of Objects
Stock stocks = new Stock();
ArrayList<Heart> heart_tree = new ArrayList<Heart>();
Star[] sky = new Star[200];
ArrayList<Firework> fireworks = new ArrayList<Firework>();
Explosion [] bob = new Explosion[200];

// Fireworks
PVector gravity = new PVector(0, 0.2);
int firework_canvas = 10;

// Fractal Tree
double fractionLength = .7; 
int smallestBranch = 5; 
double branchAngle = .15; 
int x_steps = 100;
int y_steps = 200;

// Heart Stock Graph
int myColor = 255;
int secondColor = 0;
int explosion_x = 0;
int explosion_y = 0;

// Promposal Text
PFont cursive; 
int text_y = 1200;

// Starting Indicators
int starting = 0;
boolean start_promposal = false;


public void setup(){
  smooth();
  background(0);
  size(600,600);
  frameRate(30);
  cursive = loadFont("SnellRoundhand-64.vlw");
  // Starry Background for Fireworks
  for (int i = 0; i < sky.length; i++){
    sky[i] = new Star();
  }
  // Heart Tree ArrayList
  for (int i = 0; i < 1; i++) {
    heart_tree.add(new Heart()); 
  }
}
public void draw(){
  if (start_promposal == true){
    if (starting == 0 && x_steps <= 650){
      // Heart Fractal Tree Scene
      first_part();
    }
    else if (starting == 1){
      // Blue Heart Transformation
      second_part();
    }
    else{
      // Heart Explosion
      for (int i=0; i < bob.length; i++)
    {
      bob[i].show();
      bob[i].move();
    }
      // Fireworks
      third_part();
    } 
    // Clear screen for next scene when blue heart leaves 
  if (x_steps >= 650){
    x_steps = 550;
    background(0);
    starting = 1;
   }
   
  }
  else{
    // Starting screen
    start_screen();
  }
}
public void first_part(){
  // Draw Blue Heart 
  draw_heart(x_steps, y_steps, secondColor, myColor);
  if (y_steps <= height-100){
    // Blue heart floats down
    y_steps+=3;
  }
  else{
    // Blue heart walks away and claims to want to transform
    fill(0);
    rect(20, height - 170, 200, 30);
    fill(255);
    textSize(14);
    textAlign(CENTER);
    text("I want to be a red heart too", 120, height-150);
    x_steps+=2;
  }
  // Blue heart eats a red heart 
  for (int i = 0; i < heart_tree.size(); i++) {
    if (dist(heart_tree.get(i).get_X(), heart_tree.get(i).get_Y(), x_steps, y_steps) < 20){
      heart_tree.remove(i);
    }
}
  // Heart Fractal Tree
  drawBranches(300, 500, 200, 3*Math.PI/2);
  fill(255);
  rect(0,height - 100, 1000, 50);
  
}
public void second_part(){
  // Show stocks graph
  stocks.show();
  // if below y threshold draw graph
  if(stocks.getX()+20<=480 && stocks.getY() >= 100){
    stocks.move();
    draw_heart(stocks.getX()+20, stocks.getY(), secondColor, myColor);
    // Changes blue heart to red one
    if (myColor <= 0){
      myColor = 0;
    }
    else if (secondColor >= 255){
      secondColor=255;
    }
    myColor-=1;
    secondColor+=1;
  }
  else{
    // Set up to explode heart
    explosion_x = stocks.getX()+20;
    explosion_y = stocks.getY()-20;
    for(int i = 0; i < bob.length; i++)
  {
    bob[i] = new Explosion(explosion_x, explosion_y);
  }
    starting = 2;
  }
}

public void third_part(){
  translate(0,0);
  colorMode(HSB);
  // Starry sky
  for (int i = 0; i < sky.length; i++){
    sky[i].show();
  }
  // Draw fireworks and write message
  write_message();
  draw_fireworks();
}

public void draw_heart(int x, int y, int myColor, int secondColor){
  push();
  translate(x, y);
  noStroke();
  fill(0);
  rect(-20, -60, 50, 62);
  fill(myColor, 0, secondColor);
  beginShape();
  vertex(0, -35);
  bezierVertex(0, -55, 40, -45, 0, -10);
  vertex(0, -35);
  bezierVertex(0, -55, -40, -45, 0, -10);
  endShape();
  pop();
  
}

public void draw_fireworks(){
  if (random(1) < 0.08) {
    fireworks.add(new Firework());
  }
  fill(firework_canvas, firework_canvas);
  noStroke();
  rect(0,0,width,height);

  
  for (int i = fireworks.size()-1; i >= 0; i--) {
    Firework f = fireworks.get(i);
    f.run();
    if (f.done()) {
      fireworks.remove(i);
    }
  }
}

public void write_message(){
  fill(255);
  textFont(cursive);
  textAlign(CENTER);
  textSize(90);
  String message = "Will you go";
  String message0 = "to";
  String message1 = "prom with me?";
  text(message, 300, text_y);
  text(message0, 300, text_y + 100);
  text(message1, 300, text_y + 200);
  if (text_y >= 200){
    text_y-=2;
  }
  
}

public void drawBranches(int x,int y, double branchLength, double angle) 
{

  double angle1, angle2;
  angle1 = angle + branchAngle;
  angle2 = angle - branchAngle;
  
  branchLength = branchLength*fractionLength;
  
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength - 3, angle1 + PI/5);
    drawBranches(endX2, endY2, branchLength - 3, angle2 - PI/5);
  }
  
  for (int i = 0; i < heart_tree.size(); i++) {
    heart_tree.get(i).show(x, y);
  }
  
} 

public void start_screen(){
    fill(255);
    textSize(32);
    textAlign(CENTER);
    text("Press any key to start", width/2, height/2);
}

public void keyPressed() {
  background(0);
  start_promposal = true;
}
