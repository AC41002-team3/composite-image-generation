%%Get number of tiles and the target RGB values for them
function [tileRGB,xTLen,yTLen,xTiles,yTiles] = TileImage (src, tileN)
    %%Get the number of x and y pixels
    [xpx,ypx] = size(src);
    %%
    %%Caluclate X and Y tile numbers||DOES NOT WORK WITH SQUARES
    dvsrs = divisor(tileN);
    xTiles = dvsrs(length(dvsrs)/2);
    yTiles = dvsrs((length(dvsrs)/2+1));
    %%
    %%Calculate tile widths and heights
    xTLen = round(xpx/xTiles);
    yTLen = round(ypx/yTiles);
    %%
    %%Calculate RGB values of each tile
    tRGB=cell(xTLen,yTLen);
        parfor i=1:xTiles
            c=(i*xTiles)-xTiles;
            for j=1:yTiles                         
                r=(j*yTiles)-yTiles;
                srcTl=imcrop(src,[c r (c+xTiles) (r+yTiles)]);
                tRGB{i,j}= {mean(mean(srcTl))};                
            end            
        end
    tileRGB=tRGB(~cellfun('isempty',tRGB));
end