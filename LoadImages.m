function [ imageList ] = LoadImages( imageDirectory )
% LOADIMAGES Provide directory of images,
% and a structured array shall be returned.
    imageList = dir(strcat(imageDirectory, '*.jpg'));
end

