function performa = knn(data_train,data_test)

    %training = data_train(1:7,:); %input data train urutan berapa

    %testing = data_test(501:600,:); %input data test urutan berapa

    model = ClassificationKNN.fit(data_train(:,1:6),data_train(:,7));

    class_predict = predict(model,data_test(:,1:6));
    perf=classperf(data_test(:,7),class_predict);
    performa=[perf.CorrectRate perf.Sensitivity perf.Specificity];
end

