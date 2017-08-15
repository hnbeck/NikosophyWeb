
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

}

// Main draw loop
void draw(){
  background(100,100,100);
  image(webImg, 100, 0);
}
