%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sample code demonstrating the segmentation into LAP (or two steps)

close all; clear all; clc;

%% Add path 
addPathTASS;


file_name = '04_01_01_01.txt';

%% Prepare folder
name_ext = regexp(file_name, '\.', 'split');
dir_name = cell2mat(name_ext(1,1));
dir_path = strcat('data/',dir_name, '/');
mkdir('data', dir_name);

%% Load the skeletal data
SkeletonW = LoadSkeleton(file_name, 3);

%% Segment the data into laps
[SkeletonS, Seg] = Segmentation2(SkeletonW, @WalkingForwardX, @WalkingBackwardY);

% %% Segment the data into two steps
% [SkeletonS, Seg] = Segmentation(SkeletonW, @FeetDistance, @WalkingBackwardY);

%% Write the segmented skeletal sequences
for i=1:length(SkeletonS)
	skeleton_data = cell2mat(SkeletonS(1,i));
	%% Write Skeleton data
    WriteSkeleton([dir_path,dir_name,'_skel_',num2str(i),'.txt'], SkeletonS{i}, 'Microsoft Kinect SDK');
    scores = GetTrajectory(skeleton_data);
    WriteTrajectory([dir_path,dir_name,'_tra_',num2str(i),'.txt'], scores);
    densities = GetDensity(skeleton_data);
    WriteDensity([dir_path,dir_name,'_den_',num2str(i),'.txt'], densities);
end



%% Segmentation index
%%Seg