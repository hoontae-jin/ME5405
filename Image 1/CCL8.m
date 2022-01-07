function CCL8(binary_Basic)
% 5.2. 8-Neighbouring Connectivity
%  Padding for boundary conditions
Label2= padarray(double(binary_Basic), [1 1], 0, 'both');
% Set initial variables
[m, n] = size(binary_Basic);
new_Label = 0; 
% Symbolize the pixel values (0 and 1) to perform the scanning 
Label2(Label2==0)=-1;
Label2(Label2==1)=-3;
%Scan the binary image and label components 
for i=2:m
    for j=2:n
        Current_Pixel = Label2(i,j);
        if Current_Pixel == -3
            V1 = Label2(i-1,j-1);
            V2 = Label2(i-1,j);
            V3 = Label2(i,j-1);
            V4 = Label2(i-1,j+1);
            if V3 > 0
                Label2(i,j)=V3;
                if ~(V1==V3) && V1 > 0
                    Label2(Label2==V3)=V1;
                elseif ~(V2==V3) && V2 > 0
                    Label2(Label2==V3)=V2;
                elseif ~(V4==V3) && V4 > 0
                    Label2(Label2==V3)=V4;
                end
            elseif V1 > 0
                Label2(i,j)=V1;
                if ~(V1==V4) && V4 > 0
                    Label2(Label2==V1)=V4;
                end
            elseif V2 > 0
                Label2(i,j)=V2;               
            elseif V4 > 0
                Label2(i,j)=V4;                
            else
                new_Label = new_Label + 1;
                Label2(i,j) = new_Label;
            end
        end
    end
end
Label2(Label2==-1)=0;
Label2=Label2(2:end-1,2:end-1);
Values2=unique(Label2,'stable'); 

% Label connected components
subplot(1,2,2)
imshow(label2rgb(uint8(Label2),'jet','k','shuffle'),'InitialMagnification', 'fit')
title('8-neighbour connectivity')
end
