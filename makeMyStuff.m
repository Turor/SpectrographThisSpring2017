function [ ] = makeMyStuff(audiosignal, mywindowlength, framerate, figurehandle, ...
    samplerate,t0,tf,duration,moviename,paddingpoints)
%makeMyStuff plots my three plots at once and captures them at a set
%framerate!
%  
samplerange = mywindowlength*samplerate;
length = duration*framerate;
time = t0:1/samplerate:tf;
scanincrement=samplerate/framerate;
framelength = framerate*mywindowlength;
ymax = max(audiosignal);
ymin = min(audiosignal);


windowsize = round(samplerange/80);
noverlap = round(windowsize/2);

nfft = 2^12;



%% Video Stuff
myVideo = VideoWriter(moviename);
myVideo.FrameRate = framerate;
%myVideo.CompressionRatio = 3;
open(myVideo);


%% Algorithm


for i=1:length
    figure(figurehandle)
  
    
    audioindex = round(scanincrement*i);
    if i<= framelength
        if i == 1

  %          copyobj(graph,subplot(4,6,[4,5,6,10,11,12,16,17,18]));
            subplot(4,6,[4,5,6,10,11,12,16,17,18])
            spectrogram(audiosignal(1:samplerange),gausswin(windowsize),noverlap,nfft,samplerate,'minThreshold', -110);
            hold on
            subplot(4,6,[1,2,3,7,8,9,13,14,15]);
            spectrogram(audiosignal(1:samplerange),gausswin(windowsize),noverlap,nfft,samplerate,'minThreshold', -110)
            view([120 55]);
            
            subplot(4,6,19:24);
            plot(time(1:audioindex),audiosignal(1:audioindex))
            xlim([0 mywindowlength])
        else
            subplot(4,6,19:24)
            plot(time(1:audioindex),audiosignal(1:audioindex))
            xlim([0 mywindowlength])
            ylim([ymin ymax]);
        end
    else
        subplot(4,6,[4,5,6,10,11,12,16,17,18]);
        spectrogram(audiosignal(audioindex-samplerange+1:audioindex),gausswin(windowsize),noverlap,nfft,samplerate, 'minThreshold', -110);
        hold on
        subplot(4,6,[1,2,3,7,8,9,13,14,15]);
        spectrogram(audiosignal(audioindex-samplerange+1:audioindex),gausswin(windowsize),noverlap,nfft,samplerate,'minThreshold', -110);
        view([120 55])
        hold on
        
        
        subplot(4,6,19:24)
        plot(time(audioindex-samplerange+1:audioindex),audiosignal(audioindex-samplerange+1:audioindex));
        xlim([(i-framelength)/framerate i/framerate])
        ylim([ymin ymax]);
    end
    writeVideo(myVideo,getframe(gcf));
end
for i = 1:(paddingpoints + 25)
    writeVideo(myVideo,getframe(gcf));
end
close(myVideo);
end

