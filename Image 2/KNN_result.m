accuracies = load('accuracies.mat');
accuracies = accuracies.accuracies
x = 1:100;
figure()

plot(x, accuracies)
title('Accuracy-K');
xlabel('K');
ylabel('Accuracy')