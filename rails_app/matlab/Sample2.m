%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sample code demonstrating the segmentation into LAP (or two steps)

close all; clear all; clc;

%% Add path 
addPathTASS;

%% Load the skeletal data
SkeletonW = LoadSkeleton('05_00_01_02.txt', 3);

%% Segment the data into laps
[SkeletonS, Seg] = Segmentation2(SkeletonW, @WalkingForwardX, @WalkingBackwardY);

% %% Segment the data into two steps
% [SkeletonS, Seg] = Segmentation(SkeletonW, @FeetDistance, @WalkingBackwardY);

%% Write the segmented skeletal sequences
for i=1:length(SkeletonS)
    WriteSkeleton([num2str(i),'.txt'], SkeletonS{i}, 'Microsoft Kinect SDK');
end

%% Segmentation index
Seg