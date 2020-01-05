clc; clear; close all;

%%%%% 参数设置
fname = 'vienna16';

imsrc = [fname, '.tif'];

h = 256;  %高
w = 256;  %宽

im = imread(imsrc);
fname = ['img\', fname];
cut_path(im,h,w,fname)


function cut_path(im,h,w, fname)
    s = 0;
    [rows, cols, dims] = size(im);
    m = ceil((rows-s)/(h-s));  %行
    n = ceil((cols-s)/(w-s));  %列
    [rows, cols, ~] = size(im);
    
    k = 0;
    for i = 1:m
        for j = 1:n
            x1 = (i-1)*(h-s) + 1;
            x2 = i*h - (i-1)*s;
            y1 = (j-1)*(w-s) + 1;
            y2 = j*w - (j-1)*s;
            k = k + 1;
            if x2>rows 
                x2 = rows;
                x1 = x2 - h + 1;
            end
            if y2>cols
                y2 = cols;
                y1 = y2 - w + 1;
            end

            str = [fname, '-', num2str(k), '.tif'];
            patch = im(x1:x2, y1:y2,:);
            imwrite(patch, str);
        end
    end
end
