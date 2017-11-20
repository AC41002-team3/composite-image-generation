%%Get number of tiles and the target RGB values for them
function [tileRGB,xTLen,yTLen,xTiles,yTiles,tgt] = TileImage (tgt, tileN)
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
    %%
    %%Resize origional image to rounded size
    tgt=imresize(tgt,[(xTLen*xTiles) (yTLen*yTiles)]);
    %%
    %%Calculate RGB values of each tile
    tRGB=cell(xTiles,yTiles);
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