[devices, names] = GetKeyboardIndices;
KEYBOARDTOUSE = '';
DEVICE = max(devices(cellfun(@(x) ~isempty(x), regexpi(names,KEYBOARDTOUSE))));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Basic Numerical Comparison Task in PTB - PBS 2 Prac
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Generate a Subject ID
subjectID = MakeSubjectID;


% Open a PTB Window
[w,rect] = OpenPTBWindow();

% Write the instructions to the buffer
DrawSomeText(w,rect,'In this task you have to decide whether the presented numbers is less than or greater than 5. Press q for less than 5 and p for greater than 5.\n\nPress any key when you are ready to start')

% Present the instructions on the screen
Screen('Flip',w)

% Wait u qnitl a key is pressed
KbWait(-1);

% Generate some trials
trialTable = MakeTrials;



% Start recording keyboard responses

KbQueueCreate(DEVICE)
KbQueueStart(DEVICE)

% Now loop through all the trials 

for trial = 1 : height(trialTable) % tables use 'height' instead of 'length'
   
    
    thisStimulus = trialTable.Stimulus{trial};
    
    
    % Show a fixation cross for .5 seconds
    % Draw it
    DrawFixationCross(w,rect)
    
    % Show it
    Screen('Flip',w);
    
    % Wait .5 seconds
    WaitSecs(.5)
    
    
    % Prepare the stimulus
    DrawSomeText(w,rect,thisStimulus);
    
    % Flush the keyboard queue
    KbQueueFlush(DEVICE)
    
    % Show the stimulus
    stimulusOnsent = Screen('Flip',w);
    
    [pressTime,keyName] = CollectResponses(DEVICE);
    
    % Take away the stimulus after a response
    Screen('Flip',w);
     
    % Store the responses 
    trialTable.Response(trial) = keyName;
    
    trialTable.RT(trial) = pressTime - stimulusOnsent;
    
    % Wait .5 seconds before the next trial
    
    WaitSecs(.5)
    
   
end

KbQueueStop(DEVICE); 
KbQueueRelease(DEVICE);

clear Screen
disp('THANKS!!');


% Now do some data processing

participantData = CalculateMeansAndPlot(trialTable);

% Send the data

SendData(subjectID,trialTable);