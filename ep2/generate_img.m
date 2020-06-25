function generate_img (w, h, f)
  img = zeros(w,h,3);
  for i = 1:w
    for j = 1:h
        if (f == 1)
          img(i, j, 1) = sin(i);
          img(i, j, 2) = (sin(j) + sin(i))/2.0;
          img(i, j, 3) = sin(i);
        elseif (f == 2)
          img(i, j, 1) = cos(i);
          img(i, j, 2) = sin(i*i);
          img(i, j, 3) = 2*cos(i);
        elseif (f == 3)
          img(i, j, 1) = j*j;
          img(i, j, 2) = i*i;
          img(i, j, 3) = sin(i);
        endif
    endfor
  endfor
  imwrite(img, "c2.png");
endfunction