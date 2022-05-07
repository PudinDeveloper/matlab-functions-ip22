x = zeros(3);

y = [0 1; 1 0];

sx = size(x);
sy = size(y);
a = max(sx(1),sy(1));
z = [[x;zeros(abs([a 0]-sx))],[y;zeros(abs([a,0]-sy))]];

% Cortar Excendente Matrix
z(:, 1) = [];
z(:, 1) = [];

b = [35, 1, 6, 26, 19, 24;
     3, 32, 7, 21, 23, 25;
     31, 9, 2, 22, 27, 20;
     8, 28, 33, 17, 10, 15;
     30, 15, 13, 12, 14, 16;
     4, 36, 29, 13, 18, 11;
];

a = imdilate(b, z);
g = imerode(b, z);