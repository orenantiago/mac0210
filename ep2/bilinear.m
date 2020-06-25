function decompressed = bilinear(img, k, h)
  n = rows(img);
  channels = size(img, 3)
  finalSize = n + (n-1)*k;
  decompressed = createEmptySquares(img, k, finalSize);
  B = [1, 0, 0, 0; 1, 0, h, 0; 1, h, 0, 0; 1, h, h, h.^2];
  for channel = 1:channels
    % iterate through every square generated between known pixels
    % each square has side k, starting at index 1
    for x = 1:(k+1):(finalSize-(k+1))
      for y = 1:(k+1):(finalSize-(k+1))
        % create matrix with square vertices
        q00 = decompressed(x, y, channel);
        q01 = decompressed(x, y + (k+1), channel);
        q10 = decompressed(x + (k+1), y, channel);
        q11 = decompressed(x + (k+1), y + (k+1), channel);
        V = [q00; q01; q10; q11];
        % evaluate coeficients by solving V = B x coef
        coef = inv(B) * double(V);
        % evaluate interpolated points inside square 
        for i = x:x+(k+1)
          for j = y:y+(k+1)
            % do not interpolate vertices
            if (i != x && j != y)
              % get pixel coordinates (u,v) mapped to the its square 
              u = (h*(i-x)/(k+1));
              v = (h*(j-y)/(k+1));
              % fit pixels coordinates inside square of side h and do the interpolation
              pixel = coef(1) + coef(2)*u + coef(3)*v + coef(4)*u*v;
              decompressed(i, j, channel) = pixel;
            endif
          endfor
        endfor
      endfor
    endfor
  endfor
endfunction