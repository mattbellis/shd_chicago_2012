// A simple Particle class

class Particle {
  PVector loc;
  PVector vel;
  PVector acc;
  float r;
  float timer;
  int R;
  int G;
  int B;
  int transparency;
  int pflag;
  
  // Another constructor (the one we are using here)
  Particle(PVector l, PVector v, PVector a, float energy, int xpflag) {
    acc = a.get();
    //acc = new PVector(0,0.0,0);
    vel = v.get();
    loc = l.get();
    r = energy;
    timer = 20-energy;
    pflag = xpflag;
    if (pflag==1) {
      R=0; G=191; B=255;
    } else if (pflag==-1) {
      R=255; G=191; B=0;
    }else if (pflag==2) {
      R=0; G=191; B=255;
      timer=40;
    } else if (pflag==-2) {
      R=255; G=191; B=0;
      timer=200;
    }
  }

  // Another constructor (the one we are using here)
  Particle(PVector l,int red,int green,int blue) {
    float xdir=random(-2,2);
    float ydir=random(-2,2);
    acc = new PVector(-0.05*xdir,-0.05*ydir,0);
    //acc = new PVector(0,0.0,0);
    vel = new PVector(xdir,ydir,0);
    loc = l.get();
    r = 30.0;
    timer = 100.0;
    R=red;
    G=green;
    B=blue;
    println(B);
  }

  void run() {
    update();
    render();
  }

  // Method to update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    timer -= 1.0;
  }

  // Method to display
  void render() {
    //stroke(255,timer);
    //fill(100,timer);
    stroke(R,G,B,40);
    fill(R,G,B,20);
    if (abs(pflag)==2)
    {
      fill(R,G,B,100);
    }
    ellipseMode(CENTER);
    ellipse(loc.x,loc.y,r,r);
    pushMatrix();
    stroke(255);
    popMatrix();
    //displayVector(vel,loc.x,loc.y,10);
  }
  
  // Is the particle still useful?
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } else if (loc.x<0 || loc.x>screen_width || loc.y<0 || loc.y>screen_height) {
      return false;
    } else {
      return false;
    }
  }
  
   void displayVector(PVector v, float x, float y, float scayl) {
    pushMatrix();
    stroke(255);
    /*
    float arrowsize = 4;
    // Translate to location to render vector
    translate(x,y);
    stroke(255);
    // Call vector heading function to get direction (note that pointing up is a heading of 0) and rotate
    rotate(v.heading2D());
    // Calculate length of vector & scale it to be bigger or smaller if necessary
    float len = v.mag()*scayl;
    // Draw three lines to make an arrow (draw pointing up since we've rotate to the proper direction)
    line(0,0,len,0);
    line(len,0,len-arrowsize,+arrowsize/2);
    line(len,0,len-arrowsize,-arrowsize/2);
    */
    popMatrix();
  } 

}

