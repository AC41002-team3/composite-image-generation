function [tles] = LoadImages (tleFolder)
%%load files from selected directory
currentFolder = cd(tleFolder);
tlesLs = dir('*.jpg');
for x=1:length(tlesLs)
    curTle=imread(tlesLs(x).name);
    tles{x}=curTle;
end
%%
%%Switch back to default folder
cd(currentFolder);
end