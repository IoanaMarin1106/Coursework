function [A_k S] = task4(image, k)
  image_matrix = double(imread(image));
  [m n] = size(image_matrix);
   for i = 1:m
    miu(i,1) = mean(image_matrix(i, :));
  endfor
  
  for i = 1:m
    image_matrix(i, :) = image_matrix(i, :) - miu(i);
  endfor
  
  Z = image_matrix* (image_matrix'/(n-1));
  [V S] = eig(Z);
   W = V(:, 1:k);
   Y = W' * image_matrix;
  A_k = W*Y + miu;
endfunction
