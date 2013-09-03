function Seg=CutTask(output_dir, file_name)

%% Prepare folder
name_ext = regexp(file_name, '\.', 'split');
dir_name = cell2mat(name_ext(1,1));
dir_path = strcat(output_dir,'/',dir_name, '/');


%% Load the skeletal data
SkeletonW = LoadSkeleton(file_name, 3);

%% Segment the data into laps
[SkeletonS, Seg] = Segmentation2(SkeletonW, @WalkingForwardX, @WalkingBackwardY);

% %% Segment the data into two steps
% [SkeletonS, Seg] = Segmentation(SkeletonW, @FeetDistance, @WalkingBackwardY);

%% Write the segmented skeletal sequences
try
    cvideo = VideoReader([dir_name,'_C.avi']);
    dvideo = VideoReader([dir_name,'_D.avi']);
    svideo = VideoReader([dir_name,'_S.avi']);
    mkdir(output_dir, dir_name);
    for i=1:size(Seg,1)
        cutmovie([dir_path,dir_name,'_C_',num2str(i),'.avi'], Seg(i,1), Seg(i,2), cvideo);
        cutmovie([dir_path,dir_name,'_D_',num2str(i),'.avi'], Seg(i,1), Seg(i,2), dvideo);
        cutmovie([dir_path,dir_name,'_S_',num2str(i),'.avi'], Seg(i,1), Seg(i,2), svideo);
    end
catch err
end