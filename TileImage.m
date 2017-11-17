%%Get number of tiles and the target RGB values for them
function [tileRGB,xTLen,yTLen,xTiles,yTiles] = TileImage (tgt, tileN)
    %%Get the number of x and y pixels
    [xpx,ypx,zpx] = size(tgt);
    %%
    %%Caluclate X and Y tile numbers||DOES NOT WORK WITH SQUARES
    dvsrs = divisor(tileN);
    xTiles = dvsrs(floor((length(dvsrs)/2)));
    yTiles = dvsrs(floor((length(dvsrs)/2)+1));
    %%
    %%Calculate tile widths and heights
    xTLen = round(xpx/xTiles);
    yTLen = round(ypx/yTiles);
    %%
    %%Calculate RGB values of each tile
    tRGB=cell(xTLen,yTLen);
        for i=1:xTiles
            c=(i*xTLen);
            for j=1:yTiles                         
                r=(j*yTLen);
                srcTl=imcrop(tgt,[c r (c+xTLen) (r+yTLen)]);
                tRGB{i,j}= {mean(mean(srcTl))};                
            end            
        end
    tileRGB=tRGB(~cellfun('isempty',tRGB))';
end