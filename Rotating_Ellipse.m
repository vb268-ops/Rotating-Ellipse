%Rotating ellipse
%10/23/2021
%Done with adding changing angle of theta to x and y cosine and sine
%Tried with rotating matrix but had distortions

clc
clear all

theta = 0:0.1:(2*pi + 1);
length_theta = length(theta);

%Angles required to be rotated by in successive steps
angle = [0 pi/4 pi/2 (2*pi)/3 pi 1.25*pi 1.5*pi 1.75*pi 2*pi];

for j=angle
    for i=1:length(theta)
        r(i) = sqrt(36/( (4*(cos(theta(i)))^2) + (9*(sin(theta(i)))^2)));
        x(i) = j + r(i)*cos(theta(i) + j);
        y(i) = j + r(i)*sin(theta(i) + j);
    end
    
    h2 = plot((x),(y));
    xlabel('X');
    ylabel('Y')
    xlim([-5 10]);
    ylim([-5 10]);
    
    %Collecting Frame
    movieVector(i) = getframe;
    
    %Optional Pause in Sequence
    %pause(0.05);
    
    %To end Operation
    if j == 2*pi
        break
    end
    
    %Deleting to store next frame in next iteration
    delete([h2]);
end

%Creating MPEG-4 file saved in folder on system
myWriter = VideoWriter('ZLS_Movie','MPEG-4');
warning('off')
myWriter.FrameRate = 1/0.1;
open(myWriter);
writeVideo(myWriter,movieVector);
close(myWriter);