
// Global variables
var alpha;
var delta;
var webImg;
var maskImg;

// Setup the Processing Canvas
function preload() {
  var url = "/img/intro.png";
  var urlMask = "/img/mask.png";
  webImg = loadImage(url);
  maskImg = loadImage(urlMask);
}

function setup() {
  var myCanvas = createCanvas(500, 200);
  myCanvas.parent('processingCanvas');
  webImg.mask(maskImg);
  alpha = 0.0;
  delta = 1.0;
  imageMode(CENTER);
}

// Main draw loop
function draw(){
  background(100,100,120);
  translate(width/2,height/2);
  scale(0.7);
  rotate(radians(alpha));
  alpha = alpha + delta;
  if (alpha >40)
    { delta = -1.0; }
  if (alpha <-40)
    { delta = 1.0; }

  image(webImg, 0, 0);
}
