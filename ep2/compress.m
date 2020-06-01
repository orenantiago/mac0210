function compress (originalImg, k)
    img = imread(originalImg);
    resultImg = img(k:k:end, k:k:end, :);
    imwrite(resultImg, "compressed.png");
endfunction