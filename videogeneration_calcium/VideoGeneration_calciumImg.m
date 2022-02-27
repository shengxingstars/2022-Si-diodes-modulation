clc;
close all;
figure
x1=0;s=1;
nframes=100;
data=xlsread('C:\Users\hrq\Desktop\0120\抑制 y\0003 8 5s y.xls');
fileName = 'C:\Users\hrq\Desktop\视频\抑制0003 8 5 视频.avi'; 
obj = VideoReader(fileName);
numFrames = obj.NumberOfFrames;
vidObj = VideoWriter('C:\Users\hrq\Desktop\video 3.avi');
vidObj.FrameRate=10;
open(vidObj);
for k=1:nframes
    x1=x1+s;
    x=1:1:x1;
    x2=1:0.784:0.784*(k-1)+1;
    y=data;
    subplot(13,6,[7,8,9,49,50,51]);
    hold on
    for id = 1:13
        if (k == 1&&id == 4)
            text(-13,1.1,' \DeltaF/F_0', 'FontSize',8)
        end
        if(k>30&&k<39)
        subplot(13,6,[id*6-1,id*6]);
        fill([30*0.784,k*0.784,k*0.784,30*0.784],[min(y(:,id))-10,min(y(:,id))-10,max(y(:,id))+10,max(y(:,id))+10],'r','FaceColor',[1 0.8 0.8],'EdgeColor','none')
        hold on
        end
        subplot(13,6,[id*6-1,id*6]);
        plot(x2,y(x,id),'black');
        axis([0 80 min(y(:,id))-0.1 max(y(:,id))+0.1]);
        if id <13
            set(gca,'xtick',[])
        end
        set(gca,'ytick',[])
        ylabel(id)
        if id==7&&k==1
%             ylabel({'\fontsize{12pt}\rm{cell}';'\fontsize{8pt}\rm{7}'})
            text(-15,0,' Cell', 'FontSize',10,'rotation',90)
        end
        if id == 13
            xlabel('Time (s)')
        end
        hold on
    end
%     pause(0.01);
    M=getframe(gcf);
    writeVideo(vidObj,M);
end
close(vidObj);
