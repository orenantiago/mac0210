function calculateError(originalImg, decompressedImg)
  original = double(imread(originalImg));
  decompressed = double(imread(decompressedImg));  
  errR = norm(original(:, :, 1) - decompressed(:, :, 1)) / norm(original(:, :, 1));
  errG = norm(original(:, :, 2) - decompressed(:, :, 2)) / norm(original(:, :, 2));
  errB = norm(original(:, :, 3) - decompressed(:, :, 3)) / norm(original(:, :, 3));
  err = (errR + errG + errB) / 3;
endfunction