function decompressed = bilinear(img, k, h)
  n = rows(img);
  finalSize = n + (n-1)*k;
  decompressed = createEmptySquares(img, k, finalSize);
  B = [1, 0, 0, 0; 1, 0, h, 0; 1, h, 0, 0; 1, h, h, h*h];
  for channel = 1:3
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
        coef = double(inv(B)) * double(V);
        % evaluate interpolated points inside square 
        for i = x:x+(k+1)
          for j = y:y+(k+1)
            pixel = coef(1,1) + coef(2,1)*(i-x) + coef(3,1)*(j-y) + coef(4,1)*(i-x)*(j-y);
            decompressed(i, j, channel) = pixel;
          endfor
        endfor
      endfor
    endfor
  endfor
endfunction