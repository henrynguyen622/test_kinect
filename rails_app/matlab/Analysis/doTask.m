function ProcessTask(output_dir, input_dir, file_name)

%% Prepare folder
name_ext = regexp(file_name, '\.', 'split');
dir_name = cell2mat(name_ext(1,1));
dir_path = strcat(output_dir,'/',dir_name, '/');
mkdir(output_dir, dir_name);
file_name
%% Load the skeletal data
SkeletonW = LoadSkeleton([input_dir, file_name], 3);

%% Segment the data into laps
[SkeletonS, Seg] = Segmentation2(SkeletonW, @WalkingForwardX, @WalkingBackwardY);

nb_SAU = length(SkeletonS);
% %% Segment the data into two steps
% [SkeletonS, Seg] = Segmentation(SkeletonW, @FeetDistance, @WalkingBackwardY);

%% Write the segmented skeletal sequences
try
    cvideo = VideoReader([dir_name,'_C.avi']);
    dvideo = VideoReader([dir_name,'_D.avi']);
    svideo = VideoReader([dir_name,'_S.avi']);
catch err
end
    
try    
    for i=1:nb_SAU
        
        %% cut movie here
        cutmovie([dir_path,dir_name,'_C_',num2str(i),'.avi'], Seg(i,1), Seg(i,2), cvideo);
        cutmovie([dir_path,dir_name,'_D_',num2str(i),'.avi'], Seg(i,1), Seg(i,2), dvideo);
        cutmovie([dir_path,dir_name,'_S_',num2str(i),'.avi'], Seg(i,1), Seg(i,2), svideo);
        
        skeleton_data = cell2mat(SkeletonS(1,i));
        %% Write Skeleton data
        WriteSkeleton([dir_path,dir_name,'_skel_',num2str(i),'.txt'], SkeletonS{i}, 'Microsoft Kinect SDK');
        %% Write Trajactory data
        scores = GetTrajectory(skeleton_data);
        WriteTrajectory([dir_path,dir_name,'_tra_',num2str(i),'.txt'], scores);
        %% Write Density data
        densities = GetDensity(skeleton_data);
        WriteDensity([dir_path,dir_name,'_den_',num2str(i),'.txt'], densities);
        %% Write step data
        [ L, R, T, PSL, LH, RH ] = GetStep(skeleton_data);
        WriteStep([dir_path,dir_name,'_ste_',num2str(i),'.txt'], L, R, T, PSL, LH, RH);
    end
catch err
end