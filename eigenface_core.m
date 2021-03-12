function [m A eigenfaces pr_img] = eigenface_core(database_path)
  for h = 1 : 10
    image_name = strcat(database_path, strcat('/', strcat(num2str(h), '.jpg')));
    image = double(rgb2gray(imread(image_name)));
    v = reshape(image', [], 1);
    T(:, h) = v(:, 1);
  endfor
  [n1 n2] = size(T);
  for i = 1 : n1
    m(i, 1) = sum(T(i, :)) / 10; 
  endfor
  A = T - m;
  Z = A' * A;
  [V S] = eig(Z);
  S = diag(S);
  [n1 n2] = size(S);
  for i = 1 : n2
    if(S(i, :) < 1)
        V(:, i) = [];
    endif
  endfor
  eigenfaces = A * V;
  pr_img = eigenfaces' * A;
endfunction