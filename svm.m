function performa = svm(data_train,data_test)

    %training = data_train(1:7,:); %input data train urutan berapa

    %testing = data_test(501:600,:); %input data test urutan berapa

    model = svmtrain(data_train(:,1:6),data_train(:,7),'kernel_function','rbf');

    class_predict = svmclassify(model,data_test(:,1:6));
    perf=classperf(data_test(:,7),class_predict);
    performa=[perf.CorrectRate perf.Sensitivity perf.Specificity];
end

