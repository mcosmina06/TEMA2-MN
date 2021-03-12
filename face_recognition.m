function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  image = double(rgb2gray(imread(image_path)));
  v = reshape(image', [], 1);
  v = v - m;
  pr_test_img = eigenfaces' * v;
  min_dist = realmax;
  for i = 1 : 10
   eps = norm(pr_test_img - pr_img(:, i));
   if eps < min_dist
    min_dist = eps;
    output_img_index = i;
   endif
  endfor
end