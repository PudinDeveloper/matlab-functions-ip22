function b = movav(a, h)

    b = uint8(filter2(h, a, 'valid'));

end