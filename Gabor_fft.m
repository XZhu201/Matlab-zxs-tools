%%%%%%%%%%%%   Gabor Transform by Liuxi with FFT   %%%%%%%%%%%%%
%Ҫ����ı���Ϊw0,dt,Acc,г���׶�N1,N2

function Gabor_fft(w0,w0_factor,dt,dw,Acc,N1,N2,str)
time_start = tic;
sima=1/(w0_factor*w0);
T0=2*pi/w0;
N=length(Acc);

tf=[dt:dt:N*dt].'; % ʱ��������
wf = N1*w0:dw:N2*w0; %Ƶ������
w_N1 = round(N1*w0/dw)+1; % ����Ƶ�����?
w_N2 = round(N1*w0/dw)+length(wf); % ����Ƶ���յ�

TF=zeros(length(wf),N);

[SIZE1,~] = size(Acc);
if  SIZE1 ~= 1
    Acc = Acc.';
end
fprintf('\nlength(tf) = %d      \nlength(wf) = %d  \n\n',length(tf),length(wf));

tic;
for mm = 1:N    
    temp = fft(Acc.'.*exp(-(tf(mm)-tf).^2./2/sima.^2)/sqrt(2*pi)/sima);
    TF(:,mm) = temp(w_N1:w_N2); % ֻ��ȡ����ҪƵ��
    clear temp;
    if (mod(mm,1000)==0)
        temp_time=toc;
        fprintf('mm = %d  elapsed time: %6.3f  \n',mm,temp_time);
        tic;
    end
end

%% ��ͼ
%����Ϊ�״�
figure;
imagesc(tf/T0,wf/w0,log10((abs(TF)).^2));
shading interp;
set(gcf,'Color','w');
set(gca,'YDir','normal'); % ����y�ᷴת
xlabel('t/T_0'); ylabel('Harmonic Order');
colorbar; colormap(jet);
saveas(gcf,['Gabor_',str],'png');

% ����ΪeV
% figure;
% imagesc(tf/T0,wf*27.211,log10((abs(TF)).^2));
% shading interp;
% set(gcf,'Color','w');
% set(gca,'YDir','normal');
% xlabel('t/T_0'); ylabel('Photon Energy (eV)');
% colorbar; colormap(jet);
% saveas(gcf,['Gabor_eV_',str],'jpg');

%  time_all = toc(time_start);
%  fprintf('\n Walltime: %f hours\n',time_all/3600.0);
 
%  save Gabor_fft;
 
 %{
 %��ά��ֵ
 
 x = tf;  y = wf; 
 [X,Y] = meshgrid(x,y);
 
 new_x = dt/3:dt/3:N*dt;
 new_y = N1*w0:dw/3:N2*w0;
  
 [new_X,new_Y] = meshgrid(new_x,new_y);
 new_TF = interp2(X,Y,log10((abs(TF)).^2),new_X,new_Y,'spline'); % �ر�ע�⣬��log10���ٲ�ֵ
 
 figure;
imagesc(new_x/T0,new_y*27.211,new_TF);
shading interp;
set(gcf,'Color','w');
set(gca,'YDir','normal');
 
 
 
 %}
 
 
 
 
end