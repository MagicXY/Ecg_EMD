clear;clc;
load ECGDATA;   
%------ DISPLAY DATA ------------------------------------------------------
figure(1); clf, box on, hold on
    grid;
    t=(360*(60*02+00-5)+1):(360*(60*02+30+5)+1);                            %修改时间 360是他的采样频率 每秒360个点
    %t=360*72:360*85;
    Ntime=TIME(t);
    Nm1=M1(t);
    Nm2=M2(t);
%**********DISPLAY************
    plot(Ntime, (Nm1),'r');                                                      %信道1绘图，红色
if nosig==2
   % plot(Ntime, Nm2,'b');                                                       %信道2绘图，蓝色
end;
for k=1:length(ATRTIMED)
    if (ATRTIMED(k)>Ntime(1))&&(ATRTIMED(k)<Ntime(end))
        text(ATRTIMED(k),0,num2str(ANNOTD(k)));                                  %标记脉搏特征
    end;
    if ANNOTD(k)==8
           ATRTIMED(k)
    end;
end;
xlim([Ntime(1), Ntime(end)]);
xlabel('Time / s'); ylabel('Voltage / mV');
string=['ECG signal ',DATAFILE];
title(string);
fprintf(1,'\\n$> DISPLAYING DATA FINISHED \n');

save ecgdata1 Nm1 Ntime;