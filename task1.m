function A_k = task1(image_path, k)
  image_matrix = double(imread(image_path));
  [U S V] = svd(image_matrix);
  [m n] = size(image_matrix);
  U = U(1:m, 1:k);
  S = S(1:k, 1:k);
  V = V';
  V = V(1:k, 1:n);
  A_k=U*S*V;
endfunction
