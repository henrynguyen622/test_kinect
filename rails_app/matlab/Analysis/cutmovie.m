function cutmovie(File_path, from_frame, to_frame, vid)

writerObj = VideoWriter(File_path);
writerObj.FrameRate = 30;
open(writerObj);

nFrames = vid.NumberOfFrames;
vidHeight = vid.Height;
vidWidth = vid.Width;

mov(1:nFrames) = struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),'colormap', []);

for k = from_frame : to_frame
  mov(k).cdata = read(vid, k);
  writeVideo(writerObj,mov(k).cdata);
end

close(writerObj);