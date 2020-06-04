function square = fill_square(coef, k, x0, y0)
  square = ones(k, k);
  for i = 1:k
    for j = 1:k
      square(i,j) = uint8(coef(1) + coef(2)*i + coef(3)*j + coef(4)*i*j);
    endfor
  endfor
endfunction