classdef ViewFFT2
  properties
    img
    imFFT
    absFFT
    angleFFT
    realFFT
    imagFFT
    normFFT
    %
    z10
    z11
    z12
    z13
    z14
    z15
    %
    z20
    z21
    z22
    z23
    z24
    z25
    %
    z30
    z31
    z32
    z33
    z34
    z35
    %
    z40
    z41
    z42
    z43
    z44
    z45
    %
    z50
    z51
    z52
    z53
    z54
    z55
    %
    z60
    z61
    z62
    z63
    z64
    z65
    %
    subplot_row
    subplot_col
    figure_height
    figure_width
    the_title
  end
  methods
    function obj = ViewFFT2(img, subplot_row, subplot_col, figure_height, figure_width, the_title)
      obj.subplot_row = subplot_row;
      obj.subplot_col = subplot_col;
      obj.figure_height = figure_height;
      obj.figure_width = figure_width;
      obj.the_title = the_title;
      % setup x -> z=fft2
      obj=obj.setImg(img);
      figure('Position',[0,0,figure_height, figure_width]);
    end

    function obj = setImg(obj, value)
      obj.img = value;
      obj.imFFT = fft2(value);
      obj = obj.setALL(obj.imFFT);
    end

    function obj = setFFT(obj, value)
      obj.imFFT = value;
      obj = obj.setALL(value);
    end

    function obj = setALL(obj, value)
      obj.absFFT = abs(value);
      obj.angleFFT = angle(obj.imFFT);
      obj.realFFT = real(obj.imFFT);
      obj.imagFFT = imag(obj.imFFT);
      obj.normFFT = exp(i*obj.angleFFT);
      % z=fft2 -> z10=ifft2
      obj.z10 = ifft2(obj.imFFT);
      obj.z11 = abs(obj.z10);
      obj.z12 = angle(obj.z10);
      obj.z13 = real(obj.z10);
      obj.z14 = imag(obj.z10);
      obj.z15 = exp(i * obj.z12);
      % z=abs(fft2) -> z20=ifft2
      obj.z20 = ifft2(obj.absFFT);
      obj.z21 = abs(obj.z20);
      obj.z22 = angle(obj.z20);
      obj.z23 = real(obj.z20);
      obj.z24 = imag(obj.z20);
      obj.z25 = exp(i * obj.z22);
      % z=angle(fft2) -> z30=ifft2
      obj.z30 = ifft2(obj.angleFFT);
      obj.z31 = abs(obj.z30);
      obj.z32 = angle(obj.z30);
      obj.z33 = real(obj.z30);
      obj.z34 = imag(obj.z30);
      obj.z35 = exp(i * obj.z32);
      % z=real(fft2) -> z40=ifft2
      obj.z40 = ifft2(obj.realFFT);
      obj.z41 = abs(obj.z40);
      obj.z42 = angle(obj.z40);
      obj.z43 = real(obj.z40);
      obj.z44 = imag(obj.z40);
      obj.z45 = exp(i * obj.z42);
      % z=imag(fft2) -> z50=ifft2
      obj.z50 = ifft2(obj.imagFFT);
      obj.z51 = abs(obj.z50);
      obj.z52 = angle(obj.z50);
      obj.z53 = real(obj.z50);
      obj.z54 = imag(obj.z50);
      obj.z55 = exp(i * obj.z52);
      % z=imag(fft2) -> z60=ifft2
      obj.z60 = ifft2(obj.normFFT);
      obj.z61 = abs(obj.z60);
      obj.z62 = angle(obj.z60);
      obj.z63 = real(obj.z60);
      obj.z64 = imag(obj.z60);
      obj.z65 = exp(i * obj.z62);
    end

    %%  }}} fin constractor
    %%  {{{  begin functions
    function add_subplot(obj, the_image, pos, view_title)
      subplot(obj.subplot_row, obj.subplot_col, pos);
      % imshow(the_image);
      imagesc(the_image); colormap(gray);
      title(view_title);
    end

    function original(obj,view_title)
      obj.add_subplot(obj.img, 1, view_title)
    end

    function abs_fft(obj,pos,view_title)
      obj.add_subplot(obj.absFFT, pos, view_title)
    end

    function angle_fft(obj,pos,view_title)
      obj.add_subplot(obj.angleFFT, pos, view_title)
    end

    function real_fft(obj,pos,view_title)
      obj.add_subplot(obj.realFFT, pos, view_title)
    end

    function imag_fft(obj,pos,view_title)
      obj.add_subplot(obj.imagFFT, pos, view_title)
    end

    function normalise_fft(obj,pos,view_title)
      obj.add_subplot(obj.normFFT, pos, view_title)
    end

    % z10
    function abs_ifft_fft(obj,pos,view_title)
      obj.add_subplot(obj.z11, pos, view_title)
    end

    function angle_ifft_fft(obj,pos,view_title)
      obj.add_subplot(obj.z12, pos, view_title)
    end

    function real_ifft_fft(obj,pos,view_title)
      obj.add_subplot(obj.z13, pos, view_title)
    end

    function imag_ifft_fft(obj,pos,view_title)
      obj.add_subplot(obj.z14, pos, view_title)
    end

    function normalise_ifft_fft(obj,pos,view_title)
      obj.add_subplot(obj.z15, pos, view_title)
    end
    % z20
    function abs_ifft_abs_fft(obj,pos,view_title)
      obj.add_subplot(obj.z21, pos, view_title)
    end

    function angle_ifft_abs_fft(obj,pos,view_title)
      obj.add_subplot(obj.z22, pos, view_title)
    end

    function real_ifft_abs_fft(obj,pos,view_title)
      obj.add_subplot(obj.z23, pos, view_title)
    end

    function imag_ifft_abs_fft(obj,pos,view_title)
      obj.add_subplot(obj.z24, pos, view_title)
    end

    function normalise_ifft_abs_fft(obj,pos,view_title)
      obj.add_subplot(obj.z25, pos, view_title)
    end

    % z30
    function abs_ifft_angle_fft(obj,pos,view_title)
      obj.add_subplot(obj.z31, pos, view_title)
    end

    function angle_ifft_angle_fft(obj,pos,view_title)
      obj.add_subplot(obj.z32, pos, view_title)
    end

    function real_ifft_angle_fft(obj,pos,view_title)
      obj.add_subplot(obj.z33, pos, view_title)
    end

    function imag_ifft_angle_fft(obj,pos,view_title)
      obj.add_subplot(obj.z34, pos, view_title)
    end

    function normalise_ifft_angle_fft(obj,pos,view_title)
      obj.add_subplot(obj.z35, pos, view_title)
    end

    % z40
    function abs_ifft_real_fft(obj,pos,view_title)
      obj.add_subplot(obj.z41, pos, view_title)
    end

    function angle_ifft_real_fft(obj,pos,view_title)
      obj.add_subplot(obj.z42, pos, view_title)
    end

    function real_ifft_real_fft(obj,pos,view_title)
      obj.add_subplot(obj.z43, pos, view_title)
    end

    function imag_ifft_real_fft(obj,pos,view_title)
      obj.add_subplot(obj.z44, pos, view_title)
    end

    function normalise_ifft_real_fft(obj,pos,view_title)
      obj.add_subplot(obj.z45, pos, view_title)
    end

    % z50
    function abs_ifft_imag_fft(obj,pos,view_title)
      obj.add_subplot(obj.z51, pos, view_title)
    end

    function angle_ifft_imag_fft(obj,pos,view_title)
      obj.add_subplot(obj.z52, pos, view_title)
    end

    function real_ifft_imag_fft(obj,pos,view_title)
      obj.add_subplot(obj.z53, pos, view_title)
    end

    function imag_ifft_imag_fft(obj,pos,view_title)
      obj.add_subplot(obj.z54, pos, view_title)
    end

    function normalise_ifft_imag_fft(obj,pos,view_title)
      obj.add_subplot(obj.z55, pos, view_title)
    end

    % z60
    function abs_ifft_norm_fft(obj,pos,view_title)
      obj.add_subplot(obj.z61, pos, view_title)
    end

    function angle_ifft_norm_fft(obj,pos,view_title)
      obj.add_subplot(obj.z62, pos, view_title)
    end

    function real_ifft_norm_fft(obj,pos,view_title)
      obj.add_subplot(obj.z63, pos, view_title)
    end

    function imag_ifft_norm_fft(obj,pos,view_title)
      obj.add_subplot(obj.z64, pos, view_title)
    end

    function normalise_ifft_norm_fft(obj,pos,view_title)
      obj.add_subplot(obj.z65, pos, view_title)
    end
  end
end
