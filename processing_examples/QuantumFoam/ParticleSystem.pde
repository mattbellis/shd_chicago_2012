// A class to describe a group of Particles
// An ArrayList is used to manage the list of Particles 

class ParticleSystem {

  ArrayList particles;    // An arraylist for all the particles
  PVector origin;        // An origin point for where particles are born

  ParticleSystem(int num, PVector v) {
    particles = new ArrayList();              // Initialize the arraylist
    origin = v.get();                        // Store the origin point
    for (int i = 0; i < num; i++) {
      particles.add(new Particle(origin,0,191,255));    // Add "num" amount of particles to the arraylist
    }
  }

  int size() {
    return particles.size();
  }

  void run() {
    // Cycle through the ArrayList backwards b/c we are deleting
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = (Particle) particles.get(i);
      p.run();
      if (p.dead()) {
        particles.remove(i);
      }
    }
  }

  void addParticle() {
    particles.add(new Particle(origin,0,191,255));
    particles.add(new Particle(origin,255,191,0));
  }
  
  void addParticle(float x, float y,int R,int G, int B) {
    particles.add(new Particle(new PVector(x,y),R,G,B));
    particles.add(new Particle(new PVector(x,y),B,G,R));
    println("here");
  }

  void addParticle(float x, float y, int pflag) {
    float range=1.0;
    if (abs(pflag)==1)
    {
      range=10;
    }
    else if (abs(pflag)==2)
    {
      range=30;
    }
    float px=random(-range,range);
    float py=random(-range,range);
    //float px=0.0;
    //float py=5.0;
    float pmag=1.0*sqrt(px*px+py*py);
    float angle=atan2(py,px);
    println("angle: "+angle);

    println("new angle: "+cos(angle+1.57));
    println("new angle: "+sin(angle+1.57));
    float px0=px+pmag*cos(angle+1.57);
    float py0=py+pmag*sin(angle+1.57);
    float ax0=-0.10*pmag*cos(angle+1.57);
    float ay0=-0.10*pmag*sin(angle+1.57);

    float px1=px-pmag*cos(angle+1.57);
    float py1=py-pmag*sin(angle+1.57);
    float ax1=0.10*pmag*cos(angle+1.57);
    float ay1=0.10*pmag*sin(angle+1.57);

    float energy=40.0*sqrt(ax1*ax1+ay1*ay1);
    println("energy: "+energy);

    if (pflag==2)
    {
      ax0=ay0=ax1=ay1=0;
      energy = energy/3.0;
    }

    particles.add(new Particle(new PVector(x,y), new PVector(px0,py0), new PVector(ax0,ay0), energy, pflag));
    particles.add(new Particle(new PVector(x,y), new PVector(px1,py1), new PVector(ax1,ay1), energy, -pflag));
    println("here");
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  // A method to test if the particle system still has particles
  boolean dead() {
    if (particles.isEmpty()) {
      return true;
    } else {
      return false;
    }
  }

}

