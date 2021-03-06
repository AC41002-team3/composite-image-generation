%%Stitch together the composite image
function comImg = CreateImage(srcR,matches,xT,yT)
    comImg=cell(length(matches),1);
    for i=1:length(matches)
        comImg(i)={srcR{matches(i)}};
    end
    comImg=comImg(~cellfun('isempty',comImg));
    comImg=reshape(comImg,[xT, yT]);
    comImg=cell2mat(comImg);
end