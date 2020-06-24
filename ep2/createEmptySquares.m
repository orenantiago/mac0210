function decompressed = createEmptySquares(compressed, k, finalSize)
  for i = 1:finalSize
    for j = 1:finalSize
      if (rem(i, k+1) == 1 && rem(j, k+1) == 1)
        decompressed(i, j, :) = compressed((i-1)/(k+1) + 1, (j-1)/(k+1) + 1, :);
      endif
    endfor
  endfor
endfunction