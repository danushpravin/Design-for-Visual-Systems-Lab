function Out = rotate(In,Theta)
width = size(In,1);
height = size(In,2);
cp = [round(size(In,1)/2),round(size(In,2)/2)]; %Find the Center of the image
tm = [cos(Theta),-sin(Theta);sin(Theta),cos(Theta)]; %Find the forward transformation matrix
rtm = inv(tm);%Find the reverse transformation matrix
for y=1:height
    for x=1:width
        p=[x,y];%Point on the destination Image
        tp = round(rtm*(p-cp)'+cp');
        if tp(1)<1 | tp(2)<1 | tp(1)>width | tp(2)>height
            Out(x,y)=0;%If we are outside the set bounds we change colour to black
        else
            Out(x,y) = In(tp(1),tp(2));%Else we use the source image
        end
    end
end

