for PL=0:8
    filenameI=strcat('LBPFeature\Co_PL',num2str(PL),'_PR',num2str(8-PL));
    Co=load(filenameI);
    filenameI=strcat('LBPFeature\Pt_PL',num2str(PL),'_PR',num2str(8-PL));
    Pt=load(filenameI);
    dataTrain=[ Pt.LBPFeature(1:10,2:8); Co.LBPFeature(1:10,2:8)];
    dataTest=[ Pt.LBPFeature(11:17,2:8); Co.LBPFeature(11:17,2:8)];
    %ClassifierMuSAAAN(dataTrain,dataTest);
end