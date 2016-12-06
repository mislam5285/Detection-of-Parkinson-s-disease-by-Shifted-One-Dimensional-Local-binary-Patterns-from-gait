function newSignal=shifted1DLBP(signal,PL)
    sz=size(signal,2);
    PR=8-PL;
    PC=PL+1;
    %newSignal=zeros(1:sz);
    signal=[zeros(1,PL) signal zeros(1,PR)];
    for i=PL+1:PL+sz
        conv=signal(i-PL:i+PR);
        PC_val=conv(PC);
        conv=conv-PC_val;
        conv=conv>0;
        newData=[conv(1:PL) conv(PC+1:PC+PR)];
        newSignal(i-PL)=bi2de(newData,'left-msb');
    end
end