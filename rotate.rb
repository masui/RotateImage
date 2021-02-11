def make_rotated(image, degree)
  cmd = "convert #{image} -rotate +#{degree} rotated.png"
  puts cmd
  system cmd

  s = `file rotated.png`
  s =~ /(\d+)\s+x\s+(\d+)/

  width = $1.to_i
  height = $2.to_i

  puts "#{image} width=#{width}, height=#{height}"

  centerx = width / 2
  centery = height / 2
  size = 540
  posx = (width - size) / 2
  posy = (height - size) / 2
  
  posx = posy = 184 # うーん謎だ... 回転する前の画像での値を使うとよい感じ? 回転後の画像のサイズを使うとうまくいかない
  
  cmd = "convert rotated.png -gravity NorthWest -crop #{size}x#{size}+#{posx}+#{posy} junk.png"
  puts cmd
  system cmd

  cmd = "convert junk.png -distort perspective '0,0 0,0 0,360 0,200 360,0 360,0 360,360 360,360' rotated#{degree}.png" # 射影変換
  puts cmd
  system cmd
end

image = "nazo.png"

step = 3
degree = 0

while degree < 360 do
  make_rotated(image, sprintf("%03d",degree))
  degree += step
end

system "convert -dispose previous -delay 2 -loop 0 rotated???.png nazo.gif" # disposeオプションが無いと重ね書きになってしまう
