function decompress (compressedImg, method, k, h)
  img = imread(compressedImg);
  n = rows(img)
  decompressed = ones(n + (n-1)*k, n + (n-1)*k, 3);
  for c = 1:3
    ix = 1;
    for x = 1:(n-1)
      iy = 1;
      for y = 1:(n-1)
  %      debugging
  %      printf("(%d, %d)\n", x, y);
  %      printf("(%d, %d)\n", x+h, y);
  %      printf("(%d, %d)\n", x, y+h);
  %      printf("(%d, %d)\n", x+h, y+h);
  %      v+=4;
  %      printf("------------\n");
        q1 = img(x, y, c); 
        q2 = img(x+1, y, c);
        q3 = img(x, y+1, c);
        q4 = img(x+1, y+1, c);
        # bilinear matrix to calculate coeficients
        B = double([1, x, y, x*y; 1, x, y+1, x*(y+1); 1, x+1, y, (x+1)*y; 1, (x+1), (y+1), (x+1)*(y+1)]);
        coef = B \ double([q1; q2; q3; q4]);
        interpolated_pixels = fill_square(coef, k, x, y);
        %p = rows(interpolated_pixels);
%        decompressed(ix, iy, c) = img(x,y, c);
%        decompressed(ix + k + 1, iy, c) = img(x+1, y, c);
%        decompressed(ix, iy + k + 1, c) = img(x , y+1, c);
%        decompressed(ix + k + 1, iy + k + 1, c) = img(x+1, y+1, c);
        decompressed(ix + 1:ix + k, iy + 1: iy + k, c) = interpolated_pixels; 
        iy += k + 1;
      endfor
      ix += k + 1;
    endfor
   endfor
%   decompressed
  imwrite(decompressed, "decompressed.png")
endfunction