% Test ViewFFT2
mag=zeros(100,100);
ph=zeros(100,100);
mag(2,3)=1;
mag2=mag;
img=zeros(100,100);
% creal obj v from class ViewFFT2
v = ViewFFT2(img,1,3,1200,1200/2, "titre2");

create_fft = mag.*exp(1i*ph);
% i have alot of valriables, i not know how use set.setFFT
% so i use a copy from v -> v
% so i can not yet execute only > v.setFFT(create_fft);
v          = v.setFFT(create_fft);

v.original("original");
v.real_fft(2,"real ifft fft");
v.real_ifft_fft(3,"real ifft fft");
