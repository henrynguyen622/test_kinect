vid = VideoReader('05_00_01_02_C.avi');
writerObj = VideoWriter('05_00_01_02_C1.avi');
writerObj.FrameRate = 30;
open(writerObj);

nFrames = vid.NumberOfFrames;
vidHeight = vid.Height;
vidWidth = vid.Width;

mov(1:nFrames) = struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),'colormap', []);

for k = 52 : 444
  mov(k).cdata = read(vid, k);
  writeVideo(writerObj,mov(k).cdata);
end

close(writerObj);

writerObj = VideoWriter('05_00_01_02_C2.avi');
writerObj.FrameRate = 30;
open(writerObj);

nFrames = vid.NumberOfFrames;
vidHeight = vid.Height;
vidWidth = vid.Width;

mov(1:nFrames) = struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),'colormap', []);

for k = 444 : 840
  mov(k).cdata = read(vid, k);
  writeVideo(writerObj,mov(k).cdata);
end

close(writerObj);