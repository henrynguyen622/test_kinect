function WriteTrajectory(File_path, Trajectory)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Usage
%% Write2File(File_path, Trajectory)
%%
%% Input:
%% File_path: the path of the file
%% Skeleton_data: Trajectory data.
%%
%% Example:
%% Write2File('C:\Trajectory.txt', Trajectory)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Open file to write data
fid = fopen(File_path, 'w');
num_points = size(Trajectory,1);
fprintf(fid, '%d %d\n', num_points, size(Trajectory,2)); %% Size of matrix
%% Now start writing the files
for i=1:num_points
    fprintf(fid, '%f %f\n', Trajectory(i,1),Trajectory(i,2)); %% frame index
end
fclose(fid);