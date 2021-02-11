all: clean
	ruby rotate.rb
	scp nazo.gif pitecan.com:/www/www.pitecan.com/tmp
	open test.html
clean:
	/bin/rm -f rotated*.png rotated*.gif
