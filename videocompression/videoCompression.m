fileFolder=fullfile('D:\FFOutput');
dirOutput=dir(fullfile(fileFolder,'*.mp4'));
fileNames={dirOutput.name};
for i = fileNames
path=strcat('D:\FFOutput\',i);
path=path{1};
obj = VideoReader(path);%原始视频
numFrames = obj.NumberOfFrames;% 帧的总数

%视频压缩 
newPath = 'D:\光刺激\抖脚2\压缩';
newName = ['size544x960',obj.Name];
newfps = obj.FrameRate;
newObj=VideoWriter([newPath,'\',newName]);  %创建一个avi视频文件对象，开始时其为空
newObj.FrameRate=newfps;
open(newObj);


hwait=waitbar(0,'正在转换视频分辨率...');
for i = 1:numFrames
    frame = read(obj,i);
    newFrame = imresize(frame,[960 544]); 
    if mod(i,numFrames/100) == 0
        waitbar(i/numFrames,hwait);
    end
    %写视频
    writeVideo(newObj,newFrame);
end
close(newObj);
close(hwait);
end