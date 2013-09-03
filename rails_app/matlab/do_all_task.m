%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sample code demonstrating the segmentation into LAP (or two steps)

close all; clear all; clc;

%% Add path 
addPathTASS;

files = dir('input\*.txt');
for i = 1:size(files,1)
	doTask('output','input/',files(i,1).name);
end
