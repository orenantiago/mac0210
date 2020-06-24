% evaluate dfdy approximation
function dy = dfdy(f, i, j, finalSize, k, h)
  if (j <= 1)
    dy = (f(i, j+(k+1), :) - f(i, j, :))/(h);
  elseif (j >= finalSize-(k+1))
    dy = (f(i, j, :) - f(i, j-(k+1), :))/(h);
  else
    dy = (f(i, j+(k+1), :) - f(i, j-(k+1), :))/(2*h);
  endif
endfunction