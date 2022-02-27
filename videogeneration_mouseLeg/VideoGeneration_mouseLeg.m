clear
clc
n=210;
vidObj = VideoWriter('C:\Users\hrq\Desktop\0201\video.avi');
vidObj.FrameRate=30;
open(vidObj);
fileName = 'C:\Users\hrq\Desktop\video\size544x960IMG_6315.mp4DLC_resnet50_6303_2jan16shuffle1_1500_labeled.mp4';
obj = VideoReader(fileName);
numFrames = obj.NumberOfFrames;
data=xlsread('C:\Users\hrq\Desktop\0201\6315.xls');
t=0:1:size(data,1)-1;
x=0;
d=200;
m=data;
data2=xlsread('C:\Users\hrq\Desktop\0201\6316.xls');


t2=0:1:size(data2,1)-1;
m2=data2;
data3=xlsread('C:\Users\hrq\Desktop\0201\6317.xls');

t3=0:1:size(data3,1)-1;
m3=data3;
    subplot(3,2,6);
plot(t3,m3);
sgtitle('635nm, 0.4Hz, 0.04W/cm^2')
xlabel('Time (s)')
line([x,x],[-1,4],'linewidth',2,'color','r')
axis([x,x+d,-1,4]); %移动坐标系
% set(gca,'xtick',1:30:size(data,1)) 
set(gca,'ytick',-1:4)
set(gca,'xtick',1:30:size(data3,1)) 
set(gca,'XTickLabel',1:length(1:30:size(data3,1)));
    subplot(3,2,4);
plot(t2,m2);
line([x,x],[-1,4],'linewidth',2,'color','r')
axis([x,x+d,-1,4]); %移动坐标系
set(gca,'xtick',1:30:size(data2,1)) 
set(gca,'XTickLabel',1:length(1:30:size(data2,1)));
axis([x,x+d ,-1,4]);
set(gca,'ytick',-1:4)
ylabel('Hindlimb lifting displacement (mm)')
subplot(3,2,2);

plot(t,m);
line([1,1],[-1,4],'linewidth',2,'color','r')
hold on
axis([x,x+d ,-1,4]);
while 1
    if x>n
        break;
    end
    x=x+1;
    axis([x,x+d,-1,4]); %移动坐标系
    set(gca,'xtick',1:30:size(data,1)) 
    line([x,x],[-1,4],'linewidth',2,'color','r')
    set(gca,'ytick',-1:4)
    set(gca,'XTickLabel',1:length(1:30:size(data,1)));
    M=getframe(gcf);
    writeVideo(vidObj,M);
end
close(vidObj);