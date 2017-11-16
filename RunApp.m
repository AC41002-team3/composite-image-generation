function cIm = RunApp (src,tgt,tileN)
    [tRGB,x,y,xT,yT] = TileImage(src,tileN);
    srcR = ResizeSourceImages(src,x,y);
    srcRGB=GetSrcRGBs(srcR);
    matches=FindTiles(srcRGB,tRGB);
    cIm=CreateImage(srcR,matches,xT,yT);
    
end