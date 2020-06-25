function err = calculateError(originalImg, decompressedImg)
  original = double(imread(originalImg));
  decompressed = double(imread(decompressedImg));  
  decSize = rows(decompressed);
  errR = norm(original(1:decSize, 1:decSize, 1) - decompressed(:, :, 1)) / norm(original(1:decSize, 1:decSize, 1))
  errG = norm(original(1:decSize, 1:decSize, 2) - decompressed(:, :, 2)) / norm(original(1:decSize, 1:decSize, 2))
  errB = norm(original(1:decSize, 1:decSize, 3) - decompressed(:, :, 3)) / norm(original(1:decSize, 1:decSize, 3))
  err = (errR + errG + errB) / 3;
endfunction