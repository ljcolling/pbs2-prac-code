function participantData = CalculateMeansAndPlot(trialTable)

correctTrials = trialTable(trialTable.CorrectResponse == trialTable.Response,:);

sTrials = correctTrials(ismember(correctTrials.Condition,'s'),:);
bTrials = correctTrials(ismember(correctTrials.Condition,'b'),:);


[meanVal_bTrials,ciLimits_bTrials] = CalcMean_CI(bTrials.RT);
[meanVal_sTrials,ciLimits_sTrials] = CalcMean_CI(sTrials.RT);

figure;
errorbar(1,meanVal_bTrials,diff(ciLimits_sTrials),'b'); hold on;
scatter(1,meanVal_sTrials,'b','filled');

errorbar(2,meanVal_bTrials,diff(ciLimits_bTrials),'r');
scatter(2,meanVal_bTrials,'r','filled');

xlabel('Condition')
xticks([1 2])
xticklabels({'< 5','> 5'})
xlim([0 3])
ylim([0 max([ciLimits_sTrials ciLimits_bTrials]) + .20])
ylabel('Reaction Time')

participantData.bTrials = meanVal_bTrials;
participantData.sTrials = meanVal_sTrials;