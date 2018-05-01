function [ audiosignal ] = reduceSampleRate( factor, audiodata )
%reduceSampleRate takes an audio signal and reduces the sample rate
%   Inputs: Factor and Audio Data. Factor is the reduction factor and the
%   audio data is a structure containing the audio info.
%   Outputs: Audiosignal. This audio signal is the originally signal after
%   being modified.
size(audiodata.Signal(:,1))
samplelength = size(audiodata.Signal(:,1))-mod(size(audiodata.Signal(:,1)),factor)
reduced = samplelength(1)/factor
audiosignal = zeros(reduced,1);
for i=1:reduced
    audiosignal(i) = audiodata.Signal(i*factor,1);
end
end

