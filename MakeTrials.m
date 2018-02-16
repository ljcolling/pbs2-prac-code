function [trialTable] = MakeTrials
stimuli = repmat([1 4 6 9],1,10);
stimuli = Shuffle(stimuli);
responses = arrayfun(@(x) MatchNumberToResponse(x), stimuli);
condition = arrayfun(@(x) {MatchNumberToCondition(x)}, stimuli);

stimuli = arrayfun(@(x) {num2str(x)},stimuli);

trialTable = table(stimuli',responses',condition','VariableNames',{'Stimulus','CorrectResponse','Condition'});

% Add a col to store response 
trialTable.Response = nan(height(trialTable),1);

% Add a col to store the RT
trialTable.RT = nan(height(trialTable),1);


function response = MatchNumberToResponse(number)

switch number
    case 1
        response = KbName('q');
    case 4
        response = KbName('q');
    case 6
        response = KbName('p');
    case 9
        response = KbName('p');
end

function condition = MatchNumberToCondition(number)

switch number
    case 1
        condition = 's';
    case 4
        condition = 's';
    case 6
        condition = 'b';
    case 9
        condition = 'b';
end