%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Sample code demonstrating the segmentation into LAP (or two steps)

close all; clear all; clc;

%% Add path 
addPathTASS;

processFiles = {};
out_folder = '../public/movie';
while 1 < 3
    %sleep 1 second
    pause(1.001);
    files = dir('input\*.done');
    for i = 1:size(files,1)
        isprocess = 0;
        pause(0.001);
        for j = 1:size(processFiles,2)
            if strcmp(processFiles{j},files(i,1).name) == 1
                isprocess = 1;
            end
        end
        if isprocess == 0
            processFiles{size(processFiles,2)+1} = files(i,1).name;
			taskid = strrep(files(i,1).name, '.done', '');
            doTask('output','input/',[taskid,'.txt']);
            files(i,1).name
			
			
			
			avifiles = dir(['output', '\', taskid,'\*.avi']);
			for j = 1:size(avifiles,1)
				file_name = ['output', '\', taskid,'\',avifiles(j,1).name];
				out_file = [out_folder, '\',strrep(avifiles(j,1).name, 'avi', 'mp4')];
				cmd_str = ['ffmpeg -loglevel quiet -i ', file_name, ' -vcodec libx264 ', out_file];
				system(cmd_str);
			end
			
			%% should print the done file here so that ruby knows to start processing
			done_file_name = ['output', '\', taskid,'.done'];
			fid = fopen(done_file_name, 'w');
			fclose(fid);
			
        end
    end
end

%for i = 1:size(files,1)
%    doTask('output',files(i,1).name);
%end
