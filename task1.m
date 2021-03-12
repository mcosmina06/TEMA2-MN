function A_k = task1(image, k)
  A_k = imread(image);
  A_k = double(A_k);
  [U S V] = svd(A_k);
  A_k = U(: , 1 : k) * S(1 : k, 1 : k) * V(:, 1 : k)';
end