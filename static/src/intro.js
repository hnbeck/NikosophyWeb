
// Global variables
var alpha;
var delta;
var webImg;
var maskImg;

// Setup the Processing Canvas
function preload() {
  var url = "/img/intro.png";
  var urlMask = "/img/mask.jpg";
  webImg = loadImage(url);
  maskImg = loadImage(urlMask);
}

function setup() {
  var myCanvas = createCanvas(300, 200);
  myCanvas.parent('processingCanvas');
  frameRate(10);
  alpha = 0.0;
  delta = 1.0;
  webImg.mask(maskImg);
}

// Main draw loop
function draw(){
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
}
