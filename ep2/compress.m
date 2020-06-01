function compress (originalImg, k)
    img = imread(originalImg);
    resultImg = img(k+1:k+1:end, k+1:k+1:end, :);
    imwrite(resultImg, "compressed.png");
endfunction