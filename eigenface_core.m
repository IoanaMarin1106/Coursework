function [m A eigenfaces pr_img] = eigenface_core(database_path)
  % We construct the T matrix
  nr_col_T = 0;
  for i = 1:10
    image_matrix = double(rgb2gray(imread([database_path, '/', int2str(i),'.jpg'])));
    [nr nc] = size(image_matrix);
    k = 0;
    for i = 1:nr
      for j = 1:nc
        v(++k) = image_matrix(i,j);
      endfor
    endfor
    v = v';
    T(:, ++nr_col_T) = v;
  endfor
  
  % We calculate the average on each line of the T matrix
 m = (mean(T'))';  
  
  % We calculate the T matric
  A = T - m;
  
  % We construct the V matrix
  nr_col_V = 0;
  matrix = A' * A;
  [vect valp] = eig(matrix);
  [nr nc] = size(valp);
  for i = 1:nc
    if valp(i,i) > 1
      V(:, ++nr_col_V) = vect(:,i);
    endif
  endfor
  
  % We calculate eigenfaces and pr_img
  eigenfaces = A * V; 
  pr_img = eigenfaces' * A;
endfunction
