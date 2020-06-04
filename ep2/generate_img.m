function generate_img (w, h)
  img = zeros(w,h,3)
  for i = 1:w
    for j = 1:h
      img(i, j, 1) = sin(i);
      img(i, j, 2) = (sin(j) + sin(i))/2.0;
      img(i, j, 3) = sin(i);
    endfor
  endfor
  imwrite(img, "c2.png");
endfunction