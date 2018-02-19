function participantData = CalculateMeansAndPlot(trialTable)

correctTrials = trialTable(trialTable.CorrectResponse == trialTable.Response,:);

sTrials = correctTrials(ismember(correctTrials.Condition,'s'),:);
bTrials = correctTrials(ismember(correctTrials.Condition,'b'),:);


[meanVal_bTrials,ciLimits_bTrials] = CalcMean_CI(bTrials.RT);
[meanVal_sTrials,ciLimits_sTrials] = CalcMean_CI(sTrials.RT);

figure;
errorbar(1,meanVal_sTrials,diff(ciLimits_sTrials),'b'); hold on;
scatter(1,meanVal_sTrials,'b','filled');

errorbar(2,meanVal_bTrials,diff(ciLimits_bTrials),'r');
scatter(2,meanVal_bTrials,'r','filled');

xlabel('Condition')
set(gca,'XTick',[1 2])
set(gca,'XTickLabel',{'close to 5','far from 5'})
set(gca,'XLim',[0 3])
set(gca,'YLim',[0 max([ciLimits_sTrials ciLimits_bTrials]) + .20])
ylabel('Reaction Time')

participantData.bTrials = meanVal_bTrials;
participantData.sTrials = meanVal_sTrials;