% Matlab code to plot jpg images with geolocation 
%output is a Matlab figure with image locations and a kml 
% By C. Scott, ASU, August 3, 2018

warning off

% p folder: Upper directory of all the imagery
% output_kml: name and path to kml
p = [';',genpath('')];
output_kml='';

%if site is in the western hemisphere, west =1; otherwise west =-1;
west=1;



a=[find(p==';')];
locs=[];  locsgood=[];
for i=1:length(a)-1
listing = dir((p(a(i)+1:a(i+1)-1)));
for j=3:length(listing)
    file=[p(a(i)+1:a(i+1)-1),'\',listing(j).name];
    [filepath,name,ext] = fileparts(file);
    if length(ext)==4
    if sum(ext=='.JPG')==4;
          if sum(name(1)=='D')==1;
    in=imfinfo(file);
   lat=in.GPSInfo.GPSLatitude;
   lat=lat(1)+lat(2)/60+lat(3)/3600;
    long=in.GPSInfo.GPSLongitude;
    long=long(1)+long(2)/60+long(3)/3600;
    locs=[locs;[long lat i]];
     
    end
    end
    end
end 
end

mult=west*-1;
close all

figure
scatter(mult*locs(:,1),locs(:,2),10,locs(:,3),'filled');hold on 
axis equal
xlabel('long (^o)');ylabel('lat(^o)')
title('Image locations')

Name = blanks(length(locs));
kmlwritepoint(output_kml, locs(:,2), mult*locs(:,1),'Name',Name);





