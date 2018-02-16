[devices, names] = GetKeyboardIndices;
ScreenNumbers = Screen('Screens');

% now create two new variables that will take the values you want from the variables the first two lines created

SCREEN_TO_USE = min(ScreenNumbers); % use the primary display
DEVICE_TO_USE = min(devices); % use the primary keyboard

% Generate a Subject ID
subjectID = MakeSubjectID;

Screen('Preference', 'SkipSyncTests', 1);

[w,rect] = PsychImaging('OpenWindow',SCREEN_TO_USE,[],[0 0 800 600]);



Screen('TextSize',w,24);
DrawFormattedText(w,'Push z if the number is less than 5 and push m if the number is greater than 5','center','center',[],60)

Screen('Flip',w)

KbWait(DEVICE_TO_USE); % wait for a key press

Screen('Flip',w); % clear the screen

trialTable = MakeTrials;

KbQueueCreate(DEVICE_TO_USE)
KbQueueStart(DEVICE_TO_USE)

for t = 1 : size(trialTable,1)
    
    thisStimulus = trialTable.Stimulus{t} % select a stimulus
    
    DrawFixationCross(w,rect) % draw a fixation cross
    
    Screen('Flip',w) % show it
    
    WaitSecs(.5) % pause for .5 seconds
    
    
    DrawFormattedText(w,thisStimulus,'center','center',[],60) % draw the stimulus
    
    KbQueueFlush(DEVICE_TO_USE) % flush the kb queue
    
    stimulusOnsent = Screen('Flip',w) % show the stimulus
    % and record the time it was shown
    
    [pressTime,keyCode] = CollectResponses(DEVICE_TO_USE)

    
    % Take away the stimulus after a response
    Screen('Flip',w);
   
    % Store the responses 
    trialTable.Response(trial) = keyCode;
    
    trialTable.RT(trial) = pressTime - stimulusOnsent;
    
    % Wait .5 seconds before the next trial
    
    WaitSecs(.5)
    
    
end

KbQueueStop(DEVICE_TO_USE);
KbQueueRelease(DEVICE_TO_USE);

