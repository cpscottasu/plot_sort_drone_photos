% Matlab code to locate and sort jpg images with geolocation within a specified polygon
% By C. Scott, ASU, March 15, 2018

% Edit the first four lines below
%folder: location where all the selected photos should be copied 
%polyx: longitude of polygon coordinates in decimal degrees. 
%polyy: latitude of polygon coordinates in decimal degrees. 
%polygon can have any shape; it need not be square or rectangular
%p folder: Upper directory of all the imagery
% path references may need to be altered for a Mac or Linux system

folder=[''];
polyx=[ ]';
polyy=[ ]';
p = [';',genpath('')];

warning off
polyx=abs(polyx);
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
     if(inpolygon(long,lat,polyx,polyy))
 new_file=[file(end-11:end-4),'_',num2str(i),file(end-3:end)];    
 copyfile(file,[folder,'\',new_file]) 
  locsgood=[locsgood;[long lat i]];
     end
    end
    end
    end
end 
end

close all
figure
scatter(locs(:,1),locs(:,2),10,'b','filled');hold on 
scatter(locsgood(:,1),locsgood(:,2),10,'g','filled');hold on 
plot(polyx,polyy,'-k')
axis equal
xlabel('long (^o)');ylabel('lat(^o)')
legend('Image locations','Images within pyolgon','polygon')
