clear;clc;
load ECGDATA;   
%------ DISPLAY DATA ------------------------------------------------------
figure(1); clf, box on, hold on
    grid;
    t=(360*(60*02+00-5)+1):(360*(60*02+30+5)+1);                            %�޸�ʱ�� 360�����Ĳ���Ƶ�� ÿ��360����
    %t=360*72:360*85;
    Ntime=TIME(t);
    Nm1=M1(t);
    Nm2=M2(t);
%**********DISPLAY************
    plot(Ntime, (Nm1),'r');                                                      %�ŵ�1��ͼ����ɫ
if nosig==2
   % plot(Ntime, Nm2,'b');                                                       %�ŵ�2��ͼ����ɫ
end;
for k=1:length(ATRTIMED)
    if (ATRTIMED(k)>Ntime(1))&&(ATRTIMED(k)<Ntime(end))
        text(ATRTIMED(k),0,num2str(ANNOTD(k)));                                  %�����������
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