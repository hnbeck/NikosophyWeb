
// Global variables
int X, Y;
int nX, nY;
int delay = 16;
float alpha;
PImage webImg;
PImage maskImg;

// Setup the Processing Canvas
void setup(){
  size(300, 200);

  String url = "/img/intro.png";
  String url2 = "/img/mask.jpg";
  // Load image from a web server
  webImg = loadImage(url);
  maskImg = loadImage(url2);
  frameRate(10);
  alpha = 0.0;
  delta = 1.0;
  webImg.mask(maskImg);
}

// Main draw loop
void draw(){
  background(100,100,120);
  translate(150,100);
  scale(0.7);
  rotate(radians(alpha));
  alpha = alpha + delta;
  if (alpha >40)
    { delta = -1.0; }
  if (alpha <-40)
    { delta = 1.0; }

  image(webImg, -100, -100);
  image(maskImg, mouseX, mouseY);
}
