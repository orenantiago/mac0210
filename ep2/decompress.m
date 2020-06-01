function decompress (compressedImg, method, k, h)
  img = imread(compressedImg);
  p = rows(img)
  #bilinear matrix to calculate coeficients
  B = double([1, 0, 0, 0; 1, 0, h, 0; 1, h, 0, 0; 1, h, h, h*h]);
  decompressed = zeros(p + (p-1)*k, p + (p-1)*k, 3);
  for channel = 1:3
    for y = 1:p-h
      for x = 1:p-h
        p0 = img(x, y, channel)
        p1 = img(x+h, y, channel)
        p2 = img(x, y+h, channel)
        p3 = img(x+h, y+h, channel)
        square_vertices = [p0; p1; p2; p3];
        coef = double(B) \ double(square_vertices)
        square = fill_square(coef, k, x, y);
        decompressed(x:x+k, y:y+k, channel) = square;
      endfor 
    endfor
   endfor
  imwrite(decompressed, "decompressed.png")
endfunction