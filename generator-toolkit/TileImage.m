%%Get number of tiles and the target RGB values for them
function [tileRGB,xTLen,yTLen,xTiles,yTiles,tgt] = TileImage (tgt, tileN, tgtPx)
    %%Resize target image
    %[xpx,ypx,zpx] = size(tgt);
	targetDvsrs = divisor(tgtPx);
    ypx = targetDvsrs(floor((length(targetDvsrs)/2))); 
    xpx = targetDvsrs(floor((length(targetDvsrs)/2)+1));
    tgt=imresize(tgt,[ypx xpx]);
    %%
    %%Caluclate X and Y tile numbers||DOES NOT WORK WITH SQUARES
    tileDvsrs = divisor(tileN);
    yTiles = tileDvsrs(floor((length(tileDvsrs)/2)));
    xTiles = tileDvsrs(floor((length(tileDvsrs)/2)+1));
    %%
    %%Calculate tile widths and heights
    xTLen = round(ypx/yTiles);
    yTLen = round(xpx/xTiles);
    %%
    %%Resize origional image to new size
    tgt=imresize(tgt,[(yTLen*yTiles) (xTLen*xTiles)]);
    %%
    %%Calculate RGB values of each tile
    tRGB=cell(yTiles,xTiles);
        c=1;
        for i=1:xTiles
            r=1;
            for j=1:yTiles             
                srcTl=imcrop(tgt,[r c yTLen xTLen]);
                r=(r+yTLen);                
                tRGB{i,j}= {mean(mean(srcTl))};                
            end
            c=(c+xTLen);
        end
    tileRGB=tRGB(~cellfun('isempty',tRGB))';
end