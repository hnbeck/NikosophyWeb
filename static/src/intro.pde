
// Global variables
int X, Y;
int nX, nY;
int delay = 16;

PImage webImg;


// Setup the Processing Canvas
void setup(){
  size(400, 200);

  String url = "/img/intro.png";
  // Load image from a web server
  webImg = loadImage(url, "png");
  framerate(15);
}

// Main draw loop
void draw(){
  background(100,100,100);
  float rad = radians(5);
  rotate(rad);
  image(webImg, , 0);
}
