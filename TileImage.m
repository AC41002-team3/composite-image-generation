%%Get number of tiles and the target RGB values for them
function [tileRGB,xTLen,yTLen,xTiles,yTiles] = TileImage (tgt, tileN)
    %%Get the number of x and y pixels
    [xpx,ypx,zpx] = size(tgt);
    %%
    %%Caluclate X and Y tile numbers||DOES NOT WORK WITH SQUARES OR PRIMES
    dvsrs = divisor(tileN);
    xTiles = dvsrs(floor((length(dvsrs)/2)));
    yTiles = dvsrs(floor((length(dvsrs)/2)+1));
    %%
    %%Calculate tile widths and heights
    xTLen = round(xpx/xTiles);
    yTLen = round(ypx/yTiles);
    tgt = imresize(tgt,[(xTLen*xTiles),(yTLen*yTiles)]);
    %%
    %%Calculate RGB values of each tile
    tRGB=cell(xTiles,yTiles);
        c=1;
        for i=1:xTiles-1
            r=1;
            for j=1:yTiles-1              
                srcTl=imcrop(tgt,[c r (c+xTLen) (r+yTLen)]);
                r=(j*yTLen);                
                tRGB{i,j}= {mean(mean(srcTl))};                
            end
            c=(i*xTLen);
        end
    tileRGB=tRGB(~cellfun('isempty',tRGB))';
end