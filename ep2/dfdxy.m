% Laboratório de Métodos Numéricos - EP 2
% Daniel Silva Nunes - 10297612
% Renan Tiago dos Santos Silva - 9793606

% evaluate df^2 /dxdy approximation
function dxy = dfdxy(f, i, j, finalSize, k, h)
  if i <= 1
    dxy = (dfdy(f, i+k+1, j, finalSize, k, h) - dfdy(f, i, j, finalSize, k, h))/(h);
  elseif i >= finalSize-(k+1)
    dxy = (dfdy(f, i, j, finalSize, k, h) - dfdy(f, i-(k+1), j, finalSize, k, h))/(h);
  else
    dxy = (dfdy(f, i+k+1, j, finalSize, k, h) - dfdy(f, i-(k+1), j, finalSize, k, h))/(2*h);
  endif
endfunction