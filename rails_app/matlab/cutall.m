%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sample code demonstrating the segmentation into LAP (or two steps)

close all; clear all; clc;

%% Add path 
addPathTASS;

files = dir('Skeletal Data\');
for i = 3:size(files,1)
	CutTask('movie',files(i,1).name);
end
