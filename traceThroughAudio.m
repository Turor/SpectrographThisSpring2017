%% Useful Constants
song = 'Starlyte - Stormchaser';
filename = strcat(song , '.mp3');
moviename = strcat(song , '.avi');
plotpoints = 10; %Number of plot points taken a second.
starttime = 0;
info = audioinfo(filename);
playtime = info.Duration - mod(info.Duration,5);
paddingimages = ceil(mod(info.Duration,5)*10);
windowlength = 5;
reducF = 4;
duration = playtime-starttime;

%% Function Calls

audiopack2 = readMyAudio(filename,playtime,starttime);
mitigated = reduceSampleRate(reducF,audiopack2);
msamplerate = audiopack2.SampleRate/reducF;

%% Define Figures
f1 = figure;
f1.Units = 'normalized';
f1.OuterPosition = [.02 .05 .95 .95];
f1.Name = 'Spectrogram';


%% Spectrogram Stuff
filtered=lowpassfilter(mitigated);
% figure(f1)
% spectrogram(filtered,512,256,1024,msamplerate)
% view([130 50])
% viewangle = [0 90];
% spectromovie1 = makeMySpectrogram(filtered, windowlength, plotpoints, f1, viewangle,...
%     msamplerate);
% viewangle = [130 50];
% spectromovie2 = makeMySpectrogram(filtered, windowlength, plotpoints, f1, viewangle,...
%     msamplerate);

%% Create Signal Movie
% signalmovie = makeMyMovie(signalplotdata(:,1), signalplotdata(:,2),plotpoints,...
%      windowlength,f1);
 
 %% Make my Stuff please function
makeMyStuff(mitigated, windowlength, plotpoints, f1, msamplerate, starttime, playtime,duration,moviename,paddingimages);
 

% %% Video Writer
% samplesperframe = audiopack2.SampleRate/50;
% myVideo = VideoWriter('kimi.avi');
% open(myVideo);
% writeVideo(myVideo,signalmovie);
 