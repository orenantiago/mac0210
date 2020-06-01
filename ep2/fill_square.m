function square = fill_square(coef, k, x0, y0)
  square = ones(k, k);
  for i = 1:k+1
    for j = 1:k+1
      square(i,j) = coef(1) + coef(2)*(x0 - i) + coef(3)*(y0 - j) + coef(4)*(x0 - i)*(y0 - j);
    endfor
  endfor
endfunction