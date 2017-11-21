function [cIm,timer] = RunApp (srcF,tgtF,tileN,tgtPx)
    tic;
    src=LoadSourceImages(srcF);
    tgt=LoadTargetImage(tgtF);
    [tRGB,x,y,xT,yT,tgt] = TileImage(tgt,tileN,tgtPx);
    srcR = ResizeSourceImages(src,x,y);
    srcRGB=GetSrcRGBs(srcR);
    matches=FindTiles(srcRGB,tRGB);
    cIm=CreateImage(srcR,matches,xT,yT);
    cIm=imgaussfilt(cIm,1);
    timer=toc;
    imshowpair(tgt,cIm,'montage');
end