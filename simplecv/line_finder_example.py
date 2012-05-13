import SimpleCV
import time

c = SimpleCV.Camera(1)
#c = SimpleCV.Camera()
js = SimpleCV.JpegStreamer() 

outfile = 'default.txt'

while(1):
  img = c.getImage()
  img = img.smooth()
  img = img.dilate()
  img = img.erode()

  width = img.width
  height = img.height

  #lines = img.findLines(threshold=25,minlinelength=20,maxlinegap=20)
  lines = img.findLines(threshold=15,minlinelength=50,maxlinegap=10)
  [line.draw(color=(255,0,0)) for line in lines]
  output = ""
  cline = SimpleCV.Line(img,((200,200),(300,300)))
  for line in lines:
      cline.draw(color=(0,0,255))
      output = ""
      #print "%f %f" % (line.x,line.y)
      output += "-------"
      output += "dimensions: %.1f %.1f\t" % (width,height)
      #print line.coordinates()
      #print "coordinates: %s" % (line.coordinates())
      output += "angle: %s\t" % (line.angle())
      print line.points
      #print len(line.points)
      #print line.points[0]
      output += "points (x,y): %f %f\t" % (line.x,line.y)
      #print line.length()
      #sum = line.length() + sum
      output += "\n"

  print output
  img.save(js.framebuffer)
  time.sleep(0.1)

  img.show()
