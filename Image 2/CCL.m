function Label2 = CCL(binary)
% 5.1. 4-Neighbouring Connectivity
%  Padding for boundary conditions
Label= padarray(double(binary), [1 1], 0, 'both');
% Set initial variables
[m, n] = size(binary);
new_Label = 0; 
% Symbolize the pixel values (0 and 1) to perform the scanning 
Label(Label==0)=-1;
Label(Label==1)=-3;
%Scan the binary image and label components 
for i=2:m
    for j=2:n
        Current_Pixel = Label(i,j);
        if Current_Pixel == -3
            V1 = Label(i-1,j); %The pixels are scanned from left to right. Hence, only consider the previously scanned values
            V2 = Label(i,j-1); %And, omit the future values {Label(i,j+1) and Label(i+1,j)}
            if V2 > 0
                Label(i,j)=V2;
                if  V1>0 && ~(V1==V2) % If V1 is available/labelled and not same as V2
                    Label(Label==V2) = V1;
                end
            elseif V1 > 0 && V2 < 0
                Label(i,j) = V1;
            else
                new_Label = new_Label + 1;
                Label(i,j) = new_Label;
            end
        end
    end
end
% Delete the padding boundary
Label = Label(2:end-1,2:end-1);
% Desymbolization & Relabelling
Label(Label==-1)=0;
Values=unique(Label); %4-Connected Component Classes

% Label connected components
figure();
subplot(1,2,1)
imshow(label2rgb(uint8(Label),'jet','k','shuffle'),'InitialMagnification', 'fit')
title('4-neighbour connectivity')

% 5.2. 8-Neighbouring Connectivity
%  Padding for boundary conditions
Label2= padarray(double(binary), [1 1], 0, 'both');
% Set initial variables
[m, n] = size(binary);
new_Label = 0; 
% Symbolize the pixel values (0 and 1) to perform the scanning 
Label2(Label2==0)=-1;
Label2(Label2==1)=-3;
%Scan the binary image and label components 
for i=2:m
    for j=2:j
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
Values2=[Values2(1); Values2(3); Values2(5); Values2(7); Values2(2); Values2(4); Values2(6)];
% Label connected components
subplot(1,2,2)
imshow(label2rgb(uint8(Label2),'jet','k','shuffle'),'InitialMagnification', 'fit')
title('8-neighbour connectivity')
end
