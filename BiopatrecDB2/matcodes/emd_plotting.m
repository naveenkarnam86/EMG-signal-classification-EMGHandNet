clc;
clear all;
close all;
figure();
subplot(EMD_seg(:,1));

[m,n] =size(EMD_seg);
x = linspace(1,m,m)';
for i=1:1:n
subplot(n,1,i);
y1 = EMD_seg(:,i);
plot(x,y1);
end



emd_1 = emd(segment(1:6000,:));
emd_1t=emd_1';
[m,n] =size(emd_1t);
x = linspace(1,m,m)';
for i=1:1:n
subplot(n,1,i);
y1 = emd_1t(:,i);
plot(x,y1);
end


 mesh(seconds(t),f,hs,'EdgeColor','none','FaceColor','interp');
         xlabel('Time (s)');
         ylabel('Frequency (Hz)');
         zlabel('Instantaneous Energy');







[imf_emd] = emd(data);
helperMRAPlot(data,imf_emd,x,'emd','Empirical Mode Decomposition',[1 2 3 6]);

subplot(6,1,2); 
y2 = EMD_seg(:,2);
plot(x,y2);

subplot(6,1,3); 
y3 = EMD_seg(:,3);
plot(x,y3);

subplot(6,1,4); 
y4 = EMD_seg(:,4);
plot(x,y4);

subplot(6,1,5); 
y5 = EMD_seg(:,5);
plot(x,y5);

subplot(6,1,6); 
y6 = EMD_seg(:,6);
plot(x,y6);