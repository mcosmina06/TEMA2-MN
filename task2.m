function task2(image)
  A = imread(image);
  A = double(A);
  [m n] = size(A);
  
  [U S V] = svd(A);
  figure
  Sd = diag(S);
  plot(Sd);
  
  k = [1:19 20:20:99 100:30:min(m, n)];
  l = length(k);
  X = zeros(l, 1);
  suma = 0;
  for i = 1 : min(m, n)
    suma = suma + S(i, i);
  endfor
  for i = 1 : l
    suma1 = 0;
    for j = 1 : k(i);
      suma1 = suma1 + Sd(j, 1);
    endfor
    suma1 = suma1 / suma;
    X(i, 1) = suma1;
  endfor
  figure
  plot(k, X);
  
  for h = 1 : l
    A_k = task1(image, k(h));
    suma = 0;
    for i = 1 : m
      for j = 1 : n
        suma = suma + (A(i, j) - A_k(i, j)) ^ 2;
      endfor
    endfor
    X(h, 1) = suma / (m * n);
  endfor
  figure
  plot(k, X);  

  for h = 1 : l
    X(h, 1) = (m * k(h) + n * k(h) + k(h)) / (m * n);
  endfor
  figure
  plot(k, X); 
end