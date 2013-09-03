function [ scores ] = GetTrajectory(skeleton)
%DRAWDATA Summary of this function goes here
%   Detailed explanation goes here

%% Set dimension is 2.
n = 2; 
B = zscore(skeleton);
[pc,score,latent,tsquare] = princomp22(B);

A1=reshape(score(:,1:2),2*size(score,1),1);
[max_number max_i]=max(abs(A1));
max_j = max_i+size(score,1);
if max_i>size(score,1)
   max_j = max_i-size(score,1); 
end
[max_number_1 max_i_1]=max(abs(score(:,2)));
first_pca = score(:,1)/max_number;
second_pca= score(:,2)/max_number;%*sign(A1(max_j));
%second_pca= score(:,2)/A1(max_i);%*prod(sign(score(:,1)));
scores=[first_pca'; second_pca']';