//import peasy.*;
import gifAnimation.*;

float a = 10;
float b = 28;
float c = 8.0/3.0;
float dt = 0.01;
float dx;
float dy;
float dz;
float ang = 0;
//PeasyCam cam;
GifMaker gif;
ArrayList<Attractor> attractors = new ArrayList<Attractor>();
  
void setup(){
  size(900, 900, P3D);
  colorMode(HSB);
  //cam = new PeasyCam(this, 500);
  for (int i = 0; i <= 3; i++){
    attractors.add(new Attractor(random(0,10),random(0,10),random(0,10)));
  }
  //gif = new GifMaker(this,"gif.gif");
  //gif.setRepeat(0);
  //gif.setDelay(40);
  frameRate(20);
}

void draw(){
  cameraRotation(ang);
  background(0);
  for (Attractor s: attractors){
      dx = (a * (s.init_pos.y - s.init_pos.x)) * dt;
      dy = (s.init_pos.x * (b - s.init_pos.z) - s.init_pos.y) * dt;
      dz = (s.init_pos.x * s.init_pos.y - c * s.init_pos.z) * dt;
      
      s.init_pos.x += dx;
      s.init_pos.y += dy;
      s.init_pos.z += dz;
      
      s.points.add(new PVector(s.init_pos.x ,s.init_pos.y, s.init_pos.z));
  }
  
  float hu = 0;
  scale(4.5);
  noFill();
  for (Attractor s: attractors){
    beginShape();
    for (PVector v: s.points){
      stroke(hu, 255, 255);
      vertex(v.x, v.y, v.z);
    
      //PVector offset = PVector.random3D();
      //offset.mult(0.1);
      //v.add(offset);
    
      hu += 0.1;
      if(hu > 255){
        hu = 0;
      }
      
    }
    endShape();
  }
  ang+=(PI/180);
  if (ang > PI * 2) ang = 0;
  //gif.addFrame();
}

void cameraRotation(float a) {
    camera(500*cos(a), -50, 500*sin(a),
    0,0,0,
    0,1,0);
}
