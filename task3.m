function [A_k S] = task3(image, k)
  A = imread(image);
  A = double(A);
  [m n] = size(A);
  mniu = zeros(m, 1);
  Z = zeros(n, m);
  for i = 1 : m
    mniu(i, 1) =  sum(A(i,:)) / n;
  endfor
  A = A - mniu;
  Z = A';
  for i = 1 : n
    for j = 1 : m
      Z(i, j) = Z(i, j) / sqrt(n - 1);
    endfor
  endfor
  [U S V] = svd(Z);
  for h = 1 : k
    W(:, h) = (V(:, h));
  endfor
  Y = W' * A;
  A_k = W * Y + mniu;  
endfunction