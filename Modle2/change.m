function y = change(u)

% if u >= 0
%     y = u - 2*pi*ceil(u/2/pi);
% else
%     y = u - 2*pi*floor(u/2/pi);
% end
% y = u - floor(u/2/pi)*2*pi - pi;
if u > pi
    y = u - ceil((u-pi)/2/pi)*2*pi;
elseif u < -pi
    y = u - floor((u+pi)/2/pi)*2*pi;
else
    y = u;
end
