%%Resizes the source files to the appropriate size
function srcR = ResizeSourceImages(srcImgs,x,y)
    l=length(srcImgs);
    parfor i=1:l
        srcImgs{i}=imresize(srcImgs{i},[x,y]);
    end
    srcR=srcImgs;
end