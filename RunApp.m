function cIm = RunApp (src,tgt,tileN)
    [tRGB,x,y,xT,yT,tgt] = TileImage(tgt,tileN);
    srcR = ResizeSourceImages(src,x,y);
    srcRGB=GetSrcRGBs(srcR);
    matches=FindTiles(srcRGB,tRGB);
    cIm=CreateImage(srcR,matches,xT,yT);
    imshowpair(tgt,cIm,'montage');
end