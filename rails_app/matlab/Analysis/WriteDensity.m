function WriteDensity(File_path, Density)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Usage
%% Write2File(File_path, Trajectory)
%%
%% Input:
%% File_path: the path of the file
%% Skeleton_data: WriteDensity data.
%%
%% Example:
%% Write2File('C:\Density.txt', Density)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Open file to write data
fid = fopen(File_path, 'w');
num_points = size(Density,2);
%% Now start writing the files
for i=1:num_points
    fprintf(fid, '%d ', Density(1,i)); %% frame index
end
fclose(fid);