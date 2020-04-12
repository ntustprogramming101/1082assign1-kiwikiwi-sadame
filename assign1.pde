PImage life;
PImage bg;
PImage groundhog;
PImage robot;
PImage soil;
PImage soldier;

float firstLifeX          = 10;
float firstLifeY          = 10;
float lifeInterval        = 20;
float lifeImageWidth      = 50;
float groundhogImageWidth = 80;

float squareLength        = 80;
float skyHeight           = squareLength*2;
float soilWidth           = squareLength*8;
float soilHeight          = squareLength*4;
float grassHeight         = 15;
float sunX                = 640-50;        
float sunY                = 50;         
float sunR                = 120;

float robotX  , robotY;
float laserX  , laserY;
float laserHeight         = 10;
float laserWidth          = 0;
float laserMaxWidth       = 40;
float laserSpeed          = 2;

float soldierX, soldierY;
float soldierSpeed        = 5;
float soldierImageWidth   = 80;

float columnAmount        = 8;
float rowAmount           = 4;


void setup() {
	size(640, 480, P2D);
//pictures
  bg         = loadImage("img/bg.jpg");
  soil       = loadImage("img/soil.png");
  life       = loadImage("img/life.png");
  groundhog  = loadImage("img/groundhog.png");
  robot      = loadImage("img/robot.png");
  soldier    = loadImage("img/soldier.png");
  
  do{
    robotX = floor(random(8));
    robotY = floor(random(4));
  }while(robotX <= 1);
  robotX   =  robotX*squareLength;
  robotY   =  skyHeight+robotY*squareLength;
  
  
  laserX   = robotX+25;
  laserY   = robotY+37;
  
  soldierX = 0;
  soldierY = floor(random(4))*squareLength;
  
}

void draw() {
  image(bg,0,0);
  
//sun
  fill(253,184,19);
  stroke(255,255,0);
  strokeWeight(5);
  ellipse(sunX, sunY, sunR, sunR);
  
//grass
  fill(124,204,25);
  noStroke();
  rectMode(CORNER);
  rect(0, skyHeight-grassHeight, width, grassHeight);
  
//soil
  image(soil,0,skyHeight,soilWidth,soilHeight);
  
//life
  image(life,firstLifeX,firstLifeY);
  image(life,firstLifeX+lifeImageWidth  +lifeInterval  , firstLifeY);
  image(life,firstLifeX+lifeImageWidth*2+lifeInterval*2, firstLifeY);
  
////groundhog
  image(groundhog, width*1/2-groundhogImageWidth/2, skyHeight-squareLength);
  

//robot&laser
  laserX -= laserSpeed; 
  if (laserWidth < laserMaxWidth-laserHeight) laserWidth += laserSpeed;
  if (laserX <= robotX-squareLength*2){
    laserX = robotX+25;
    laserWidth = 0;
  }
  
  image(robot, robotX, robotY);
  
  fill(255,0,0);
  stroke(255,0,0);
  strokeWeight(laserHeight);
  line(laserX, laserY, laserX+laserWidth, laserY);
  
//soldier
  soldierX += soldierSpeed;
  if (soldierX >= width) soldierX = -soldierImageWidth;
  
  image(soldier, soldierX, soldierY+skyHeight);
  
	
}
