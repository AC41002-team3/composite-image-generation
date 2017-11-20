%%Find the closest images for tiles
function comImg = FindTiles (srcImgs,tgtImg)
    comImg=0;
    parfor i=1:length(tgtImg)
        match=0;
        matchVal=255;
        for j=1:length(srcImgs)
            pTile=srcImgs{j};
            tTile=tgtImg{i};
            difR=abs(diff([pTile{1}(1),tTile{1}(1)]));
            difG=abs(diff([pTile{1}(2),tTile{1}(2)]));
            difB=abs(diff([pTile{1}(3),tTile{1}(3)]));
            difA=(difR+difG+difB)/3;           
            
            if(difA<matchVal)
                matchVal=difA;
                match=j;
            end
        end
        comImg(i)=match;  
    end
end