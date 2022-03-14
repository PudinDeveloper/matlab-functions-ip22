function YCBCR = Cb(img)
    RGB = img;
    YCBCR = rgb2ycbcr(RGB);
    figure
    imshow(YCBCR);
    title('Image in RGB Color Space');
end