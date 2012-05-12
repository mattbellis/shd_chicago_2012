import SimpleCV
import time

c = SimpleCV.Camera(1)
#c = SimpleCV.Camera()
js = SimpleCV.JpegStreamer() 

while(1):
  img = c.getImage()
  img = img.smooth()
  img = img.dilate()
  img = img.erode()
  #lines = img.findLines(threshold=25,minlinelength=20,maxlinegap=20)
  lines = img.findLines(threshold=15,minlinelength=50,maxlinegap=10)
  [line.draw(color=(255,0,0)) for line in lines]
  sum = 0
  for line in lines:
      #print "%f %f" % (line.x,line.y)
      print "-------"
      print line.coordinates()
      print line.points
      print line.length()
      sum = line.length() + sum
  if sum:
      print sum / len(lines)
  else:
      print "No beard found!"
  img.save(js.framebuffer)
  time.sleep(0.1)

  img.show()
