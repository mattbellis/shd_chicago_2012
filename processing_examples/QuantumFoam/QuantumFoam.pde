/**
 * Quantum foam
 * 
 */
///////////////////////////////////////////////////////////////////////////////
ParticleSystem ps;

PFont font;

///////////////////////////////////////////////////////////////////////////////
// Minim stuff
///////////////////////////////////////////////////////////////////////////////
import ddf.minim.*;

Minim minim;
AudioInput in;
///////////////////////////////////////////////////////////////////////////////

int screen_width = 1400;
int screen_height = 700;
int screen_depth = 700;

int xcenter = screen_width/2;
int ycenter = screen_height/2;
int zcenter = screen_depth/2;

int background_color = 0;

int npairs = 0;

int num = 2000;
int range = 6;

int quote_timer=0;
int quote = 0;

///////////////////////////////////////////////////////////////////////////////
// Info for particles
///////////////////////////////////////////////////////////////////////////////
float[][] x = new float[1000][3];
float[][] p = new float[1000][3];

///////////////////////////////////////////////////////////////////////////////
// Setup
///////////////////////////////////////////////////////////////////////////////
void setup() 
{
  size(screen_width,screen_height);

  frameRate(30);

  /////////////////////////////////////////////////////////////////////////////
  // For ParticleSystem
  /////////////////////////////////////////////////////////////////////////////
  colorMode(RGB, 255, 255, 255, 100);
  ps = new ParticleSystem(0, new PVector(width/2,height/2,0));
  smooth();

  minim = new Minim(this);
  minim.debugOn();

  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);

}

void draw() 
{
  /////////////////////////////////////////////////////////////////////////////
  // draw the waveforms
  /////////////////////////////////////////////////////////////////////////////
  float tot = 0.0;
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    tot += abs(in.left.get(i));
    tot += abs(in.right.get(i));
    //println(in.left.get(i));
    line(i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50);
    line(i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50);
  }
  if (tot>100)
  {
    println("tot: "+tot);
  }

  /////////////////////////////////////////////////////////////////////////////
  // Draw the images
  /////////////////////////////////////////////////////////////////////////////
  background(background_color);

  ps.run();
  if (tot>1)
  {
    int nparticles=int(tot/50);
    //println("size: "+ps.size());
    if (ps.size() <= 10)
    {
      nparticles=10;
    }
    for (int i=0;i<nparticles;i++)
    {
      int pflag=1;
      if (tot>100)
      {
        if (random(1)<0.1)
          pflag=2;
      }
      ps.addParticle(random(screen_width),random(screen_height),pflag);
      //ps.addParticle(random(screen_width),random(screen_height),1);
    }
  }

  String s = "";
  if (quote%3==0)
  {
    s = "For those who are not shocked when they first come across quantum theory cannot possibly have understood it.\n- Niels Bohr";
  }
  else if (quote%3==1)
  {
    s = "I think I can safely say that nobody understands quantum mechanics.\n-Richard Feynman";
  }
  else if (quote%3==2)
  {
    s = "I do not like it, and I am sorry I ever had anything to do with it.\n-Erwin Schrodinger";
  }

  fill(255, 255, 255,200-quote_timer);
  text(s, 15, 30,400,400); 
  textSize(24);

  quote_timer += 1;
  if (quote_timer==200)
  {
    quote_timer=0;
    quote += 1;
  }


}
