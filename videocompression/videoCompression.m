fileFolder=fullfile('D:\FFOutput');
dirOutput=dir(fullfile(fileFolder,'*.mp4'));
fileNames={dirOutput.name};
for i = fileNames
path=strcat('D:\FFOutput\',i);
path=path{1};
obj = VideoReader(path);%ԭʼ��Ƶ
numFrames = obj.NumberOfFrames;% ֡������

%��Ƶѹ�� 
newPath = 'D:\��̼�\����2\ѹ��';
newName = ['size544x960',obj.Name];
newfps = obj.FrameRate;
newObj=VideoWriter([newPath,'\',newName]);  %����һ��avi��Ƶ�ļ����󣬿�ʼʱ��Ϊ��
newObj.FrameRate=newfps;
open(newObj);


hwait=waitbar(0,'����ת����Ƶ�ֱ���...');
for i = 1:numFrames
    frame = read(obj,i);
    newFrame = imresize(frame,[960 544]); 
    if mod(i,numFrames/100) == 0
        waitbar(i/numFrames,hwait);
    end
    %д��Ƶ
    writeVideo(newObj,newFrame);
end
close(newObj);
close(hwait);
end