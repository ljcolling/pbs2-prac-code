function [w,rect] = OpenPTBWindow()

Screen('Preference', 'SkipSyncTests', 1)
[w,rect] = PsychImaging('OpenWindow',0,[],[0 0 800 600]);
