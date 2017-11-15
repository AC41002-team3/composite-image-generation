%%Load image target, REQUIRES FULL FILE AND FOLDER PATHS
function [tgt,tles] = LoadImages (tgtFilename, tleFolder)
currentFolder = cd(tleFolder);
tgt= imread(tgtFilename);
cd(tleFolder);
%%
%%load files from selected directory
tlesLs = dir('*.jpg');
for x=1:length(tlesLs)
    curTle=imread(tlesLs(x).name);
    tles{x}=curTle;
end
%%
%%Switch back to default folder
cd(currentFolder);
end