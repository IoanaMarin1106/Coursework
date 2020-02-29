function task2(image_path, k)
  image_matrix = double(imread(image_path));
  [U S V] = svd(image_matrix);
  [m n] = size(image_matrix);
  A = U*S*V;
  
  %%%-------------------
  % Generation of the first graph
  %%%--------------------
  v = diag(S);
  figure(1)
  plot(1:min(m,n), v);
  
  %%%--------------------
  % Generation of the second graph
  %%---------------------
  denominator = 0;
  for i = 1:min(m,n)
   denominator = denominator + v(i);
  endfor
  
  for i = 1:k
   vect = diag(S);
   numerator = sum(vect(1:i));
   v2(i) = numerator / denominator;
  endfor
   
   figure(2)
   plot(1:k, v2);
   
   %%%-------------------
   % Generation of the third graph
   %%%-------------------
   for p = 1:k
   A_k=task1(image_path, p);
   numerator = 0;
    for i = 1:m
      for j=1:n
        numerator = numerator + (image_matrix(i,j) - A_k(i,j))^2; 
     endfor
   endfor
   v3(p) = numerator/(m*n);
 endfor
 
  figure(3)
  plot(1:k,v3);
  
  %%%--------------------
  % Generation of the fourth graph
  %%%--------------------

  for i = 1:k
    nr = m*i + n*i + i;
    v4(i) = nr/(m*n);
  endfor
  figure(4)
  plot(1:k,v4);
endfunction
