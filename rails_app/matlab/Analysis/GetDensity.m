function [ densities ] = GetDensity(skeleton)

B = zscore(skeleton);
[pc,score,latent,tsquare] = princomp22(B);

A1=reshape(score(:,1:2),2*size(score,1),1);
[max_number max_i]=max(abs(A1));
scores=score/max_number;

max_index = size(scores,1);
r = 0.05;
frame = 80;
densities = [];
for K = 1:max_index
  den = find_density(scores(:,1:2),r,frame,K);
  densities =[densities den];
end