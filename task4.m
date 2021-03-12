function [A_k S] = task4(image, k)
  A = imread(image);
  A = double(A);
  [m n] = size(A);
  mniu = zeros(m, 1);
  Z = zeros(m, m);
  for i = 1 : m
    mniu(i, 1) =  sum(A(i,:)) / n;
  endfor
  A = A - mniu;
  Z = A * (A'/(n - 1));
  [V S] = eig(Z);
  for h = 1 : k
    W(:, h) = (V(:, h));
  endfor
  Y = W' * A;
  A_k = W * Y + mniu;  
endfunction