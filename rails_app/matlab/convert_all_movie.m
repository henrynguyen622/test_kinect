%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sample code demonstrating the segmentation into LAP (or two steps)

close all; clear all; clc;

%% Add path 
addPathTASS;

folder_name = 'movie';
out_folder = 'test2'
folders = dir([folder_name, '\0*']);
for i = 1:size(folders,1)
	files = dir([folder_name, '\', folders(i,1).name,'\*.avi']);
    for j = 1:size(files,1)
        file_name = [folder_name, '\', folders(i,1).name,'\',files(j,1).name];
        out_file = [out_folder, '\',strrep(files(j,1).name, 'avi', 'mp4')];
        cmd_str = ['ffmpeg -loglevel quiet -i ', file_name, ' -vcodec libx264 ', out_file];
        system(cmd_str);
    end
end
