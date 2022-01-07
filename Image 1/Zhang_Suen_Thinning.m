function Zhang_Suen_Thinning(img, Basic_Global_T)
%3.1. Convert the image to a binary image
[m, n] = size(img);
binary = img<Basic_Global_T; %Used the basic global thresholing method to simpify the margin determination
binary = double(binary);
%3.2. Construct the kernel matrix (3x3) and define A(P1) and B(P1).
% P1: The center (2,2) of the matrix 
% A(P1): The number of transitions from white to black in the sequence
% P2,P3...P8,P9,P2
% B(P1): The number of black pixel neighbours of P1 
ZS_img =  ones(m,n);
iteration = 1;
while iteration < 2
    for i = 2:m-1
        for j = 2:n-1
            % Kernel Construction (P1,P2,P3...P8,P9,P2)
            ZS_Kernel = [binary(i,j) binary(i-1,j) binary(i-1,j+1)...
                         binary(i,j+1) binary(i+1,j+1) binary(i+1,j)...
                         binary(i+1,j-1) binary(i,j-1) binary(i-1,j-1) binary(i-1,j)];
                     % Establish the conditions
            if (ZS_Kernel(1) == 1 && sum(ZS_Kernel(2:9)) <= 6 && sum(ZS_Kernel(2:9)) >= 2 &&...
                ZS_Kernel(2)*ZS_Kernel(4)*ZS_Kernel(6) == 0 && ZS_Kernel(4)*ZS_Kernel(6)*ZS_Kernel(8) == 0)
                         
                % A(P1) Construction
                A_P1 = 0;
                for k = 2:size(ZS_Kernel,2)-1
                    if ZS_Kernel(k) == 0 && ZS_Kernel(k+1) == 1
                         A_P1 = A_P1 + 1;
                    end
                end
                         
                if A_P1 == 1;
                    ZS_img(i,j) = 0;
                end
            end
        end
    end
    ZS_thin_img = binary.*ZS_img;
    for i = 2:m-1
        for j = 2:n-1
            % Kernel Construction (P1,P2,P3...P8,P9,P2)
            ZS_Kernel = [binary(i,j) binary(i-1,j) binary(i-1,j+1)...
                         binary(i,j+1) binary(i+1,j+1) binary(i+1,j)...
                         binary(i+1,j-1) binary(i,j-1) binary(i-1,j-1) binary(i-1,j)];
                     % Establish the conditions
            if (ZS_Kernel(1) == 1 && sum(ZS_Kernel(2:9)) <= 6 && sum(ZS_Kernel(2:9)) >= 2&&...
                ZS_Kernel(2)*ZS_Kernel(4)*ZS_Kernel(6) == 0 && ZS_Kernel(4)*ZS_Kernel(6)*ZS_Kernel(8) == 0)
                         
                 % A(P1) Construction
                A_P1 = 0;
                for k = 2:size(ZS_Kernel,2)-1
                    if ZS_Kernel(k) == 0 && ZS_Kernel(k+1) == 1
                         A_P1 = A_P1 + 1;
                    end
                end
                         
                if A_P1 == 1
                    ZS_img(i,j) = 0;
                end
            end
        end
    end
    ZS_thin_img = ZS_thin_img.*ZS_img;
    iteration = iteration + 1;
end                        
figure()
imshow(ZS_thin_img,'InitialMagnification','fit')
title('thinned image 1 by Zhang Suen Algorithm')
end
