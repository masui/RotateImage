all: clean
	ruby rotate.rb
	scp nazo.gif pitecan.com:/www/www.pitecan.com/tmp
	open test.html
clean:
	/bin/rm -f rotated*.png rotated*.gif

distort:
	convert masui.png -virtual-pixel transparent -distort perspective 0,0 0,170 0,1095 0,1095 889,0 840,0 889,1095 840,870 junk.png
