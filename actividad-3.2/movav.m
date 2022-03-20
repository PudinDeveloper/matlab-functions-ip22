function b = movav(a, mw, nw)

    h = ones(nw, mw)/(mw*nw);
    b = uint8(filter2, h, 'valid');

end