function [ min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  image_matrix = double(rgb2gray(imread(image_path)));
  
  % We repeat the first and third steps
  [nr nc] = size(image_matrix);
  k = 0;
  for i = 1:nr
    for j = 1:nc
      v(++k) = image_matrix(i,j);
    endfor
  endfor
 
 A = v' - m;
 PrTestImg = eigenfaces' * A;
 
 % We find the minimum distance between PrTestImg and each column
 %  of the pr_img matrix
 [nr nc] = size(pr_img);
 min_dist = inf;
 for i = 1:nc
  if(norm(PrTestImg-pr_img(:,i)) < min_dist)
    min_dist = norm(PrTestImg - pr_img(:,i));
    output_img_index = i;
  endif
 endfor
endfunction
