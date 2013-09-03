function WriteStep(File_path, L, R, T, PSL, LH, RH)
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
%% Now start writing the files
fprintf(fid, '%f %f %f %f %f %f', L, R, T, PSL, LH, RH); %% frame index
fclose(fid);