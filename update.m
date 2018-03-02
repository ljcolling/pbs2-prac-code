websave('CalcMean_CI.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/CalcMean_CI.m');
websave('CalculateMeansAndPlot.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/CalculateMeansAndPlot.m');
websave('CollectResponses.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/CollectResponses.m');
websave('DrawFixationCross.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/DrawFixationCross.m');
websave('DrawSomeText.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/DrawSomeText.m');
websave('InstallPTB.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/InstallPTB.m');
websave('LICENSE','https://github.com/ljcolling/pbs2-prac-code/raw/master/LICENSE');
websave('MakeData.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/MakeData.m');
websave('MakeSubjectID.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/MakeSubjectID.m');
websave('MakeTrials.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/MakeTrials.m');
websave('MyCiFun.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/MyCiFun.m');
websave('MyPTBTask_demo.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/MyPTBTask_demo.m');
websave('OpenPTBWindow.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/OpenPTBWindow.m');
websave('README.md','https://github.com/ljcolling/pbs2-prac-code/raw/master/README.md');
websave('SayHello.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/SayHello.m');
websave('SendData.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/SendData.m');
websave('SendData.p','https://github.com/ljcolling/pbs2-prac-code/raw/master/SendData.p');
websave('getfiles.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/getfiles.m');
websave('newpath.ini','https://github.com/ljcolling/pbs2-prac-code/raw/master/newpath.ini');

try
    path(path,sprintf('%s',load('newpath.ini','-ascii')))
catch
end

try
    delete MyPTBTask.m
catch
end
