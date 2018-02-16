% Update all the file

files = dir();

files = horzcat({files.name});

files = files(~ismember(files,'.'));
files = files(~ismember(files,'..'));
files = files(~ismember(files,'.git'));
files = files(~ismember(files,'makeupdate.m'));
files = files(~ismember(files,'update.m'));

fid = fopen('update.m','w');
for i = 1 : length(files)
    
fprintf(fid,['websave(''' files{i} ''',''https://github.com/ljcolling/pbs2-prac-code/raw/master/' files{i} ''')'])
fprintf(fid,'\n')
end
fclose(fid)