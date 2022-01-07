% clear;clc;
% K = 3;
% workspace_name = 'p_dataset_26/';
% fileFolder=dir(fullfile(workspace_name, 'Sample*'));
% files = [{fileFolder.name}];
% % % 
% % % % Generate train matrix
% imgs = [];
% labels = [];
% for i = 1:length(files)
%     % 1. Read Image
%     a = cell2mat(files(i));
%     label = a(end:end);
%     image_mats = dir(fullfile(strcat(workspace_name,a), '*.mat'));
%     for j = 1: length(image_mats)
%         image_mat = image_mats(j);
%         image_mat = strcat(image_mat.folder,'/', image_mat.name);
%         % 2. Flatten the Image 
%         [img img_unflatten] = expand_img(image_mat);
%         % 3. Combine flattened image to generate train matrix
%         imgs = [imgs img];
%         % 4. Label each row in the train matrix
%         labels = [labels label];
%     end  
% end
% save('imgs.mat', 'imgs');
% save('labels.mat', 'labels');
% imgs = load('imgs.mat');
% labels = load('labels.mat');
% train_img = imgs.imgs;
% labels = labels.labels;
% 
% % test images
% % 1. read Image 
% test_imgs = [];
% test_results = [];
% test_imgs_unflat = [];
% for i = 1:length(files)
%     a = cell2mat(files(i));
%     result = a(end:end);
%     image_mats = dir(fullfile(strcat(workspace_name,a), '*.mat'));
%     for j = floor(0.90 * length(image_mats)) : length(image_mats)
%         image_mat = image_mats(j);
%         image_mat = strcat(image_mat.folder,'/', image_mat.name);
%         % 2. flatten image
%         [img img_unflat] = expand_img(image_mat);
%         test_imgs = [test_imgs img];
%         test_imgs_unflat = cat(3, test_imgs_unflat, img_unflat);
%         test_results = [test_results result];
%     end  
% end
% save('test_results.mat', 'test_results');
% save('test_imgs.mat', 'test_imgs');
% 
% test_results = load('test_results.mat');
% test_imgs = load('test_imgs.mat');
% test_results = test_results.test_results;
% test_imgs = test_imgs.test_imgs;
% 
% result = [];
% expected_result = [];
% 
% accuracies = [];
% for K = 1:100
%     for i = 1:length(test_imgs(1,:))
%         new_result = test(train_img, test_imgs(:,i), labels, K);
%         result =[result; new_result(1)];
%         expected_result = [expected_result; test_results(i)];
%     end
% 
%     same_result = (result == expected_result);
%     accuracy = length(nonzeros(same_result)) / length(same_result);
%     disp(accuracy);
%     accuracies = [ accuracies accuracy]
% end

function result = KNN(test_img, K)
    imgs = load('imgs.mat');
    labels = load('labels.mat');
    train_img = imgs.imgs;
    labels = labels.labels;
    test_img = test_img(:);
    result = test(train_img, test_img, labels, K);
    result = result(1);
end


function result = test(train_img, test_img, labels, K)
    size1 = size(train_img);
    % 3. expand the flatten test image to create test matrix
    test_img_expand = [];
    for i = 1:size1(2)
        test_img_expand = [test_img_expand test_img];
    end
    % 4. Compare with train matrix and calculate distance
    difference_img = train_img - test_img_expand;
    difference_img = sqrt(sum(difference_img .^ 2));
    % 5. sort the distance in ascending order
    [sorted_difference, index] = sort(difference_img);
    output = [];
    for i = 1:K
        output = [output labels(index(i)) ];
    end
    % 6. Choose first K element and Count the label with the most occurrences
    result = [mode(output) output];
 
end

function [img_flatten img] = expand_img(img_path)
    imageStruct = load(img_path);
    img = imageStruct.imageArray;
    T = Basic_Global_Threshold(img);
    img = img < T;
    img_flatten = img(:);
end




