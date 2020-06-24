function compress (originalImg, k)
    img = imread(originalImg);
    n = rows(img);
    resultImg = img(1:k+1:n, 1:k+1:n, :);
    imwrite(resultImg, "compressed.png");
endfunction