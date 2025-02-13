function [Out] =  Lab1_Shear(In, xshear, yshear)
width=size(In,1);
height=size(In,2);
cp = [round(size(In,1)/2), round(size(In,2)/2)];%Find the Center of the image
tm = [ 1, xshear ;yshear, 1 ];  %Find the forward transformation matrix
rtm = inv (tm);%Find the reverse transformation matrix

for y=1:height
 for x=1:width
  p =[x,y];			%Point on the destination image
  tp = round((p-cp)*rtm+cp);	%Calculate nearest corresponding point on the source image
  if tp(1)<1 | tp(2)<1 | tp(1)>width | tp(2)>height
   Out(x,y)=0;			%If we are outside the bounds of the image set to black
  else
   Out(x,y)=In(tp(1),tp(2));	%Else use the source image
  end
 end
end