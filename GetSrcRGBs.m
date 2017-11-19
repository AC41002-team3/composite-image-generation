%%Gets the RGB values of source images
function srcRGB = GetSrcRGBs (srcImgs)
    l=length(srcImgs);
    srcRGB=cell(1,l);
    parfor i=1:l
        srcRGB{i}={mean(mean(srcImgs{i}))};
    end
end