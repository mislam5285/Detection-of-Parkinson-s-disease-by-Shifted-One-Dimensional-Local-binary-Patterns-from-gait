folderName={'GaPtXX_01','GaCoXX_01'};
szTrain=10;
szTest=7;

for folderNameId=1:size(folderName,2) 
    listData=dir(folderName{folderNameId});
    listDataName={listData.name};
    sizeData=size(listDataName,2)-2;
    for PL=0:8
        %training phase
        LBPSignal=zeros(sizeData,12120);
        LBPHist=zeros(sizeData,257);
        for dataIdx=1:sizeData
            dataIdxStr=num2str(dataIdx);
            dataName=listDataName{dataIdx+2};
            filenameI=strcat(folderName{folderNameId},'\',dataName);
            signal=load(filenameI);
            sinyal=signal.data';
            kodeSinyal=dataName(5:6);
            kodeSinyal=str2double(kodeSinyal);
            kodeLabel=dataName(3:4);
            [lbpHist,lbpSignal]=shifted1DLBP(sinyal,PL);
            LBPSignal(dataIdx,1:12120)=[kodeSinyal lbpSignal];
            LBPHist(PL+1,1:257)=[kodeSinyal lbpHist];
            %ekstraksiFitur %input ekstraksi fitur here%
        end
        fileNameLBPSignal=strcat('LBPSignal\',kodeLabel,'_PL',num2str(PL),'_PR',num2str(8-PL));
        save(fileNameLBPSignal,'LBPSignal');
        fileNameLBPHist=strcat('LBPHist\',kodeLabel,'_PL',num2str(PL),'_PR',num2str(8-PL));
        save(fileNameLBPHist,'LBPHist');
    end
        
end
 
