import ddf.minim.*;

Minim minim;
AudioInput in;

void setup()
{
    size(512, 200, P2D);

    minim = new Minim(this);
    minim.debugOn();

    // get a line in from Minim, default bit depth is 16
    in = minim.getLineIn(Minim.STEREO, 512);
}

void draw()
{
    background(0);
    stroke(255);

    // draw the waveforms
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
}

