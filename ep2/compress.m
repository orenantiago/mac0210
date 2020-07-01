% Laboratório de Métodos Numéricos - EP 2
% Daniel Silva Nunes - 10297612
% Renan Tiago dos Santos Silva - 9793606

function compress (originalImg, k)
    img = imread(originalImg);
    n = rows(img);
    resultImg = img(1:k+1:n, 1:k+1:n, :);
    imwrite(resultImg, "compressed.png");
endfunction