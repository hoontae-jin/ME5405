function [cell_img, Arr_img] = rearrangement(Label2,Values2)
% 6.1. Border Line Coordinates
% Found the border coordinates manually and used "IF" to locate the
% locations

for x = 1:size(Label2,1)
    for y = 1:size(Label2,2)
        %Character 1
        if Label2(x,y) == Values2(2) && Label2(x,y-1) == 0 &&...
                Label2(x-1,y) == 0 && Label2(x+1,y) == 0
            xmin_1 = [x y];
            xmin_1 = xmin_1(2);
        end
        if Label2(x,y) == Values2(2) && Label2(x,y+1) == 0 &&...
                Label2(x+1,y) == Values2(2) && Label2(x-1,y) == Values2(2) && x==8
            xmax_1 = [x y];
            xmax_1 = xmax_1(2);
        end
        if Label2(x,y) == Values2(2) && Label2(x,y-1) == 0 &&...
                Label2(x,y+1) == 0 && Label2(x+1,y) == 0
            ymin_1 = [x y];
            ymin_1 = ymin_1(1);
        end
        if Label2(x,y) == Values2(2) && Label2(x,y+1) == 0 &&...
                Label2(x-1,y) == 0 && Label2(x,y-1) == Values2(2)
            ymax_1 = [x y];
            ymax_1 = ymax_1(1);
        end
        % Character 2
        if Label2(x,y) == Values2(3) && Label2(x-1,y) == Values2(3) &&...
                Label2(x+1,y) == Values2(3) && Label2(x,y-1) == 0 && x==9 && y==30
            xmin_2 = [x y];
            xmin_2 = xmin_2(2);
        end
        if Label2(x,y) == Values2(3) && Label2(x-1,y) == 0 &&...
                Label2(x+1,y) == Values2(3) && Label2(x,y+1) == 0 && x==9
            xmax_2 = [x min(y)];
            xmax_2 = xmax_2(2);
        end
        if Label2(x,y) == Values2(3) && Label2(x,y-1) == 0 &&...
                Label2(x,y+1) == 0 && Label2(x+1,y) == 0 && y==35
            ymin_2 = [max(x) y];
            ymin_2 = ymin_2(1);
        end
        if Label2(x,y) == Values2(3) && Label2(x,y+1) == 0 &&...
                Label2(x,y-1) == Values2(3) && Label2(x-1,y) == 0 && y==36
            ymax_2 = [x y];
            ymax_2 = ymax_2(1);
        end
        % Character 3
        if Label2(x,y) == Values2(4) && Label2(x-1,y) == 0 &&...
                Label2(x+1,y) == 0 && Label2(x,y-1) == 0 && y == 51
            xmin_3 = [x y];
            xmin_3 = xmin_3(2);
        end
        if Label2(x,y) == Values2(4) && Label2(x-1,y) == Values2(4) &&...
                Label2(x+1,y) == Values2(4) && Label2(x,y+1) == 0 && x == 16
            xmax_3 = [x y];
            xmax_3 = xmax_3(2);
        end
        if Label2(x,y) == Values2(4) && y == 57 && Label2(x-1,y) == Values2(4) &&...
                Label2(x+1,y) == 0 && Label2(x,y+1) == 0
            ymin_3 = [x y];
            ymin_3 = ymin_3(1);
        end
        if Label2(x,y) == Values2(4) && y == 57 && Label2(x,y-1) == Values2(4) &&...
                Label2(x-1,y) == 0 && Label2(x,y+1) == 0
            ymax_3 = [x y];
            ymax_3 = ymax_3(1);
        end
        % Character A
        if Label2(x,y) == Values2(5) && Label2(x-1,y) == 0 && Label2(x,y-1) == 0 &&...
                Label2(x+1,y) == Values2(5) && x ==54
            xmin_A = [x y];
            xmin_A = xmin_A(2);
        end
        if Label2(x,y) == Values2(5) && Label2(x+1,y) == 0 && Label2(x,y+1) == 0 &&...
                x==54
            xmax_A = [x y];
            xmax_A = xmax_A(2);
        end
        if Label2(x,y) == Values2(5) && Label2(x,y-1) == 0 &&...
                Label2(x,y+1) == 7 && Label2(x+1,y) == 0
            ymin_A = [x y];
            ymin_A = ymin_A(1);
        end
        if Label2(x,y) == Values2(5) && Label2(x,y-1) == Values2(5) &&...
                Label2(x,y+1) == Values2(5) && Label2(x-1,y) == 0 && x==42
            ymax_A = [x y];
            ymax_A = ymax_A(1);
        end
        % Character B
        if Label2(x,y) == Values2(6) && Label2(x-1,y) == Values2(6) &&...
                Label2(x+1,y) == Values2(6) && Label2(x,y-1) == 0 && x==46
            xmin_B = [x y];
            xmin_B = xmin_B(2);
        end
        if Label2(x,y) == Values2(6) && Label2(x-1,y) == Values2(6) &&...
                Label2(x+1,y) == Values2(6) && Label2(x,y+1) == 0 && x==46
            xmax_B = [x y];
            xmax_B = xmax_B(2);
        end
        if Label2(x,y) == Values2(6) && Label2(x,y-1) == Values2(6) &&...
                Label2(x,y+1) == Values2(6) && Label2(x+1,y) == 0 && y==33
            ymin_B = [x y];
            ymin_B = ymin_B(1);
        end
        if Label2(x,y) == Values2(6) && y==33 && x==42
            ymax_B = [x y];
            ymax_B = ymax_B(1);
        end
        % Character C
        if Label2(x,y) == Values2(7) && Label2(x-1,y) == 0 &&...
                Label2(x,y-1) == 0 && Label2(x+1,y) == Values2(7) && y==49
            xmin_C = [x y];
            xmin_C = xmin_C(2);
        end
        if Label2(x,y) == Values2(7) && Label2(x-1,y) == 0 &&...
                Label2(x+1,y) == 0 && Label2(x,y+1) == 0
            xmax_C = [x y];
            xmax_C = xmax_C(2);
        end
        if Label2(x,y) == Values2(7) && Label2(x,y-1) == Values2(7) &&...
                Label2(x,y+1) == 0 && Label2(x+1,y) == 0 && y == 56
            ymin_C = [x y];
            ymin_C = ymin_C(1);
        end
        if Label2(x,y) == Values2(7) && y == 56 && x ==42
            ymax_C = [x y];
            ymax_C = ymax_C(1);
        end
    end
end
border = [];
border{1} = [ymax_1 ymin_1 xmin_1 xmax_1];
border{2} = [ymax_2 ymin_2 xmin_2 xmax_2];
border{3} = [ymax_3 ymin_3 xmin_3 xmax_3];
border{4} = [ymax_A ymin_A xmin_A xmax_A];
border{5} = [ymax_B ymin_B xmin_B xmax_B];
border{6} = [ymax_C ymin_C xmin_C xmax_C];

% Rearrange the characters in a horizontal line as shown in the task Fig
% (AB123C)
img_frame = zeros((ymin_2-ymax_2),((xmax_1-xmin_1)+(xmax_2-xmin_2)+(xmax_3-xmin_3)+...
    (xmax_A-xmin_A)+(xmax_B-xmin_B)+(xmax_C-xmin_C)));
% The character A is 1 row short hence add one empty row to be equivalent
% of the other characters' height
seg_img1 = Label2(border{1}(1):border{1}(2),border{1}(3):border{1}(4));
empty_row = zeros(1,size(seg_img1,2));
seg_img1 = [seg_img1(:,:) ; empty_row];
seg_img2 = Label2(border{2}(1):border{2}(2),border{2}(3):border{2}(4));
seg_img3 = Label2(border{3}(1):border{3}(2),border{3}(3):border{3}(4));
seg_imgA = Label2(border{4}(1):border{4}(2),border{4}(3):border{4}(4));
seg_imgB = Label2(border{5}(1):border{5}(2),border{5}(3):border{5}(4));
seg_imgC = Label2(border{6}(1):border{6}(2),border{6}(3):border{6}(4));
% Paddle one column to the left side to make the arrangement organized 
empty_col = zeros(size(seg_img1,1),1);
Arr_img = [seg_imgA empty_col seg_imgB empty_col...
    seg_img1 empty_col seg_img2 empty_col...
    seg_img3 empty_col seg_imgC ];

cell_img = {[seg_img1 empty_col], [seg_img2 empty_col], [seg_img3 empty_col], [seg_imgA empty_col], [seg_imgB empty_col], [seg_imgC empty_col]};
end
