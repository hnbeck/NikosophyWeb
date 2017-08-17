
// Global variables
int X, Y;
int nX, nY;
int delay = 16;
float alpha;
PImage webImg;


// Setup the Processing Canvas
void setup(){
  size(400, 200);

  String url = "/img/intro.png";
  // Load image from a web server
  webImg = loadImage(url, "png");
  frameRate(5);
  alpha = 0.0;
}

// Main draw loop
void draw(){
  background(100,100,150);
  translate(200,100);
  scale(0.7);
  rotate(radians(alpha));
  alpha = alpha + 2;
  if (alpha >359)
    { alpha = 0.0; }
  image(webImg, -100, -100);
}
