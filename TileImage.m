%%Get number of tiles and the target RGB values for them
function tileRGB = TileImage (image, tileN)
    %%Get the number of x and y pixels
    [y,x] = size(image);
    xpx=length(x);
    ypx=length(y);
    %%
    %%Caluclate X and Y tile numbers||DOES NOT WORK WITH SQUARES
    dvsrs = divisor(tileN);
    xTiles = dvsrs(length(dvsrs)/2);
    yTiles = dvsrs((length(dvsr)/2+1));
    %%
    %%Calculate tile widths and heights
    xTLen = round(xpx/xTiles);
    yTLen = round(ypx/yTiles);
    %%
    %%Calculate RGB values of each tile
    tRGB=zeros(xTiles,yTiles);
        for i=1:xTiles
            for j=1:yTiles
                c=(i-1)*xTLen:i*xTLen;
                r=j:(j-1)+yTLen*yTLen;
                tRGB(i,j)= mean(impixel(image,c,r));                
            end            
        end
    tileRGB=tRGB;
end