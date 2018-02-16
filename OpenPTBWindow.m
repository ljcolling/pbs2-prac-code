function [w,rect] = OpenPTBWindow()

Screen('Preference', 'SkipSyncTests', 1)

% uncomment the appropriate line below
% the first line opens a small window that is 800 x 600 pixels
% the second line opens a full screen window
% the first line is uncommented by default, so change it once everything is working!

[w,rect] = PsychImaging('OpenWindow',0,[],[0 0 800 600]);
% [w,rect] = PsychImaging('OpenWindow',0,[]);