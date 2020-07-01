% Laboratório de Métodos Numéricos - EP 2
% Daniel Silva Nunes - 10297612
% Renan Tiago dos Santos Silva - 9793606

% evaluate dfdx approximation
function dx = dfdx(f, i, j, finalSize, k, h)
  if i <= 1
    dx = (f(i + k + 1, j, :) - f(i, j, :))/(h);
  elseif i >= finalSize-(k+1)
    dx = (f(i, j, :) - f(i - (k + 1), j, :))/(h);
  else
    dx = (f(i + k + 1, j, :) - f(i - (k + 1), j, :))/(2*h);
  endif
endfunction