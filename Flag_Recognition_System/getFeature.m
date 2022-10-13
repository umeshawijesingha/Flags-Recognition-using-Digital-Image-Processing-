function [ features ] = getFeature( rgbim )
% The three features are stored as a row matrix 
 %color feature
 fet1=color_moment(rgbim);
 %edge feature
 fet2=edgehistogram(rgbim);
 %texture feature
 %glcm-gray level co occurrence matrix
 glcm=graycomatrix(rgb2gray(rgbim));
 fet3=glcm(:);
 features=[fet1;fet2;fet3];

end
