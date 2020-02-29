function [A_k S] = task3(image, k)
  image_matrix = double(imread(image));
  [m n] = size(image_matrix);
  for i = 1:m
    miu(i,1) = mean(image_matrix(i, :));
  endfor
  
  for i = 1:m
    image_matrix(i, :) = image_matrix(i, :) - miu(i);
  endfor
 
  Z = image_matrix'./sqrt(n-1);
  [U S V] = svd(Z);
  W = V(:, 1:k);
  Y = W' * image_matrix;
  A_k = W*Y + miu;
endfunction
