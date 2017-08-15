
// Global variables
float radius = 50.0;
int X, Y;
int nX, nY;
int delay = 16;

PImage webImg;

void setup() {

}

void draw() {
  background(0);
  image(webImg, 0, 0);
}
function centerCanvas() {
  var x = (windowWidth - width) / 2;
  var y = (windowHeight - height) / 2;
  cnv.position(x, y);
}


// Setup the Processing Canvas
void setup(){
  size( 400, 200 );
  centerCanvas();
  strokeWeight( 10 );
  String url = "/img/into.png";
  // Load image from a web server
  webImg = loadImage(url, "png");

  frameRate( 15 );

}

// Main draw loop
void draw(){
  image(webImg, 0, 0);
}
