/* ORBIT */
/* Giulio Smedile */
/* March - April 2018 */

PGraphics canvas;

/* center coordinates of the three circles */
float x1 = 50;
float y1 = 50;
float x2 = 0;
float y2 = 0;
float x3 = 0;
float y3 = 0;


/* radius, angle and variation of angle of the first circle */
float r1 = 70;
float a1 = 0;
float a1_v = random(-.1, .1);

/* radius, angle and variation of angle of the second circle */
float r2 = 70;
float a2 = 0;
float a2_v = random(-.2, .2);

/* radius, angle and variation of angle of the third circle */
float r3 = 70;
float a3 = 0;
float a3_v = random(-.3, .3);

/* line color */
float value1 = random(255);
float value2 = random(255);
float value3 = random(255);

void setup() {
  size(600, 600);
  smooth();
  noStroke();
  background(255,255,255,0);

  
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
  
  /* prints the velocity values in the console */
  println(a1_v);
  println(a2_v);
  println(a3_v);
}

void draw() {

  /* makes (0,0) the center of the canvas */
  translate(width/2, height/2);
  
  image(canvas, -width/2, -height/2);
  
  /* line coordinates, need to be declared at each frame or the line won't draw */
  float px1 = x1;
  float py1 = y1;
  float px2 = x2;
  float py2 = y2;
  float px3 = x3;
  float py3 = y3;

  /* updates of all values */
  a1 += a1_v;
  a2 += a2_v;
  a3 += a3_v;
  
  x1 = r1*cos(a1);
  y1 = r1*sin(a1);
  
  x2 = x1+r2*cos(a2);
  y2 = y1+r2*sin(a2);
  
  x3 = x2+r3*cos(a3);
  y3 = y2+r3*sin(a3);
  
  value1 += random(-10, 10);
  value2 += random(-10, 10);
  value3 += random(-10, 10);

  
  /* circles */
  noFill();
  ellipse(x1, y1, 10, 10);
  ellipse(x2, y2, 10, 10);
  ellipse(x3, y3, 10, 10);
  
  /* lines between the circles */
  strokeWeight(1);
  line(x1, y1, x2, y2);
  line(x2, y2, x3, y3);
  this.fill(255, 0, 0);
  this.strokeWeight(0);
  this.stroke(0);
  this.smooth();
  

  
  canvas.beginDraw();
  /* line starts to draw at second frame. if drawn from first frame
     the drawing looks horrible, trust me. */ 
  if (frameCount>2) {
    canvas.strokeWeight(0);
    canvas.stroke(0);
    canvas.translate(width/2, height/2);
    //canvas.line(x1, y1, px1, py1);
    canvas.stroke(200);
    //canvas.line(x2, y2, px2, py2);

    canvas.strokeWeight(5);
    canvas.stroke(value1, value2, value3, 200);
    canvas.line(x3, y3, px3, py3);
  }
  canvas.endDraw();
 
  
}
