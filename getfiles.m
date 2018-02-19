disp('Now I will download some files')
websave('update.m','https://github.com/ljcolling/pbs2-prac-code/raw/master/update.m')

try
    update
catch
end

try
    path(path,sprintf('%%s',load('newpath.ini','-ascii')))
catch
end

try
    delete MyPTBTask.m
catch
end