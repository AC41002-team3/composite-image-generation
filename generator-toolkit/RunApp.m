function [cIm,timer,avgRGBDIf] = RunApp (srcF,tgtF,tileN,xpx,ypx)
    tic;
    src=LoadSourceImages(srcF);
    tgt=LoadTargetImage(tgtF);
    [tRGB,x,y,xT,yT,tgt] = TileImage(tgt,tileN,xpx,ypx);
    srcR = ResizeSourceImages(src,x,y);
    clearvars src x y;
    srcRGB=GetSrcRGBs(srcR);
    [matches,~]=FindTiles(srcRGB,tRGB);
    clearvars srcRGB tRGB;
    cIm=CreateImage(srcR,matches,xT,yT);
    cIm=imgaussfilt(cIm,1);
    avgRGBDIf=TestPixels(cIm,tgt);
    timer=toc;
    imshowpair(tgt,cIm,'montage');
end