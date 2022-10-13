function [ country_name ] = countryflagRecognition( im )

clc;
if (exist('projectdb.mat')==2)
    
%resize image
im=imresize(im,[128 128]);
%remove noise;
%seperate channels
 r_channel=im(:,:,1);
 b_channel=im(:,:,2);
 g_channel=im(:,:,3);
 %denoise each channel
 r_channel=medfilt2(r_channel);
 g_channel=medfilt2(g_channel);
 b_channel=medfilt2(b_channel);
 %restore channels
 rgbim(:,:,1)=r_channel;
 rgbim(:,:,2)=g_channel;
 rgbim(:,:,3)=b_channel;
 %feature extraction
 fet=getFeature(rgbim);

    load projectdb;
   
    k=length(my_database);
    disp(k);
        for j=1:k
            D(j)=dist(fet',my_database(1,j).feature);
    end
    [value,index]=min(D);
        if value<2000
            country_name=my_database(index).unnamed;
          msgbox('Country founded','Database result','help');      
        
    else
        country_name = 'No matches found';
         warndlg('Error.',' Warning ')
        end
    
else
    msgbox('Database is empty.','Database result','help');
    country_name = 'No database';
end
end

