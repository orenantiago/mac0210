function decompressed = bicubic(decompressed, k, h)
  n = rows(decompressed);
  finalSize = n+(n-1)*k;
  channels = size(decompressed, 3)
  % image to be filled by interpolation
  decompressed = createEmptySquares(decompressed, k, finalSize);
  % given matrix
  B = [1, 0, 0, 0; 0, 0, 1, 0; -3./(h*h), 3./(h*h), -2./h, -1./h; 2./(h.^3), -2./(h.^3), 1./(h.^2), 1./(h.^2)];
  % for each square of decompressed matrix
  for x = 1:(k+1):finalSize-(k+1)
    for y = 1:(k+1):finalSize-(k+1)
      % compose the matrix of 16 elements by getting the square bounds
      % and its derivatives and mixed derivatives
      fx0y0 = decompressed(x, y, :);
      fx0y1 = decompressed(x, y+(k+1), :);
      dfdyx0y0 = dfdy(decompressed, x, y, finalSize, k, h);
      dfdyx0y1 = dfdy(decompressed, x, y+(k+1), finalSize, k, h);
      fx1y0 = decompressed(x+(k+1), y, :);
      fx1y1 = decompressed(x+(k+1), y+(k+1), :);
      dfdyx1y0 = dfdy(decompressed, x+(k+1), y, finalSize, k, h);
      dfdyx1y1 = dfdy(decompressed, x+(k+1), y+(k+1), finalSize, k, h);
      dfdxx0y0 = dfdx(decompressed, x, y, finalSize, k, h);
      dfdxx0y1 = dfdx(decompressed, x, y+(k+1), finalSize, k, h);
      dfdxyx0y0 = dfdxy(decompressed, x, y, finalSize, k, h);
      dfdxyx0y1 = dfdxy(decompressed, x, y+(k+1), finalSize, k, h);
      dfdxx1y0 = dfdx(decompressed, x+(k+1), y, finalSize, k, h);
      dfdxx1y1 = dfdx(decompressed, x+(k+1), y+(k+1), finalSize, k, h);
      dfdxyx1y0 = dfdxy(decompressed, x+(k+1), y, finalSize, k, h);
      dfdxyx1y1 = dfdxy(decompressed, x+(k+1), y+(k+1), finalSize, k, h);
      % for each color channel, evaluate pixels inside square
      for c = 1:channels
        Q = double([fx0y0(c), fx0y1(c), dfdyx0y0(c), dfdyx0y1(c);
                    fx1y0(c), fx1y1(c), dfdyx1y0(c), dfdyx1y1(c);
                    dfdxx0y0(c), dfdxx0y1(c), dfdxyx0y0(c), dfdxyx0y1(c);
                    dfdxx1y0(c), dfdxx1y1(c), dfdxyx1y0(c), dfdxyx1y1(c)]);
        coef = B * Q * transpose(B);
        % interpolate pixels inside square
        for i = x:x+(k+1)
          for j = y:y+(k+1)
            if (i != x && j != y)
              % get pixel coordinates (u,v) mapped to the its square 
              u = ((i-x)/(k+1));
              v = ((j-y)/(k+1));
              % fit pixels inside square
              R = [1, u*h, (u*h).^2, (u*h).^3];
              S = [1; (v*h); (v*h).^2; (v*h).^3];
              pixel = R * coef * S;
              decompressed(i, j, c) = pixel;
            endif
          endfor
        endfor
      endfor
    endfor
  endfor
endfunction
