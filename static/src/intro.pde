
// Global variables
float radius = 50.0;
int X, Y;
int nX, nY;
int delay = 16;

PImage webImg;
var cnv;


function centerCanvas() {
  var x = (windowWidth - width) / 2;
  var y = (windowHeight - height) / 2;
  cnv.position(x, y);
}


// Setup the Processing Canvas
void setup(){
  cnv = createCanvas(400, 200);
  centerCanvas();
  strokeWeight( 10 );

  String url = "/img/intro.png";
  // Load image from a web server
  webImg = loadImage(url, "png");

}

// Main draw loop
void draw(){
  background(0);
  image(webImg, 0, 0);
}
