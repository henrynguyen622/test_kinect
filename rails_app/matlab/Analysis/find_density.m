function [ result ] = find_density( A, r, n, i )
%DRAWDATA Summary of this function goes here
%   Detailed explanation goes here
% r is radius
% n is num frame
% i is current point
density = 0;
max_index = size(A,1);
for K = 1 : n
  if i+K <= max_index
    G = A(i,1:2);
    G2= A(i+K,1:2);
    D = norm(G - G2);
    if D<=r
      density=density+1;
    end
  end
  if i-K >= 1
    G = A(i,1:2);
    G2= A(i-K,1:2);
    D = norm(G - G2);
    if D<=r
      density=density+1;
    end
  end
end
result = density;