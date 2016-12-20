<<<<<<< HEAD
=======
perf=zeros(9,3);
>>>>>>> ee56d070f4012af1e440afd5a292b08112b68b09
for PL=0:8
    filenameI=strcat('LBPFeature\Co_PL',num2str(PL),'_PR',num2str(8-PL));
    Co=load(filenameI);
    filenameI=strcat('LBPFeature\Pt_PL',num2str(PL),'_PR',num2str(8-PL));
    Pt=load(filenameI);
    dataTrain=[ Pt.LBPFeature(1:10,2:8); Co.LBPFeature(1:10,2:8)];
    dataTest=[ Pt.LBPFeature(11:17,2:8); Co.LBPFeature(11:17,2:8)];
<<<<<<< HEAD
    %ClassifierMuSAAAN(dataTrain,dataTest);
end
=======
    performa=nb(dataTrain,dataTest);
    perf(PL+1,1:3)=performa;
end
filenameO=strcat('LBPPerforma\nb_performa.mat');
save(filenameO,'perf');
>>>>>>> ee56d070f4012af1e440afd5a292b08112b68b09
