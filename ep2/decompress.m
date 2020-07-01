% Laboratório de Métodos Numéricos - EP 2
% Daniel Silva Nunes - 10297612
% Renan Tiago dos Santos Silva - 9793606

function decompress (compressedImg, method, k, h)
  img = imread(compressedImg);
  if (method == 1)
    decompressed = bilinear(img, k, h);
  elseif (method == 2)
    decompressed = bicubic(img, k, h);
  else
    printf("Método inválido! 1: bilinear; 2: bicúbico\n");
    return;
  endif
  imwrite(decompressed, "decompressed.png")
endfunction