folderName={'GaPtXX_01','GaCoXX_01'};
szTrain=10;
szTest=7;

for folderNameId=1:size(folderName,2) 
    listData=dir(folderName{folderNameId});
    listDataName={listData.name};
    for dataIdx=1:szTrain
        dataIdxStr=num2str(dataIdx);
        filenameI=strcat(folderName{folderNameId},'\',listDataName{dataIdx+2});
        signal=load(filenameI);
        sinyal=signal.data';
        LBPSignal=zeros(9,12121);
        LBPHist=zeros(9,256);
        for PL=0:8
            [lbpHist,lbpSignal]=shifted1DLBP(sinyal,PL);
            LBPSignal(PL+1,1:12121)=[PL 8-PL lbpSignal];
            LBPHist(PL+1,1:256)=lbpHist;
            %ekstraksiFitur %input ekstraksi fitur here%
        end
        fileNameLBPSignal=strcat('LBPSignal\dataTrain',listDataName{dataIdx+2});
        save(fileNameLBPSignal,'LBPSignal');
        fileNameLBPHist=strcat('LBPHist\dataTrain',listDataName{dataIdx+2});
        save(fileNameLBPHist,'LBPHist');
    end
    
    for dataIdx=szTrain+1:szTrain+szTest
        dataIdxStr=num2str(dataIdx);
        filenameI=strcat(folderName{folderNameId},'\',listDataName{dataIdx+2});
        signal=load(filenameI);
        sinyal=signal.data';
        LBPSignal=zeros(9,12121);
        LBPHist=zeros(9,256);
        for PL=0:8
            [lbpHist,lbpSignal]=shifted1DLBP(sinyal,PL);
            LBPSignal(PL+1,1:12121)=[PL 8-PL lbpSignal];
            LBPHist(PL+1,1:256)=lbpHist;
            %ekstraksiFitur %input ekstraksi fitur here%
        end
        fileNameLBPSignal=strcat('LBPSignal\dataTest',listDataName{dataIdx+2});
        save(fileNameLBPSignal,'LBPSignal');
        fileNameLBPHist=strcat('LBPHist\dataTest',listDataName{dataIdx+2});
        save(fileNameLBPHist,'LBPHist');
    end
    
end