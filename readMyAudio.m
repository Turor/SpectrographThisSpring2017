function [ output  ] = readMyAudio( filename, playtime,starttime )
%readMyAudio takes in an audiofile's name and returns information on the audio file. 
%   Input: filename(string) Outputs: Audioinformation Structure,
%   audiosignal in a package
audioInformation = audioinfo(filename);
sr = audioInformation.SampleRate;
samples = sr*playtime;
startsample = sr*starttime;
if startsample == 0
    startsample = 1;
end
audioInformation.Signal = audioread(filename,[startsample,samples]);
output = audioInformation;
end

