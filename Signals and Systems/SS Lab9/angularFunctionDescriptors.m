function angularFunctionDescriptors(curve, nc)
X = curve(1,:); Y = curve(2,:); m = length(X);
figure, subplot(2,3,1); plot(X,Y), title('Boundary');
%computation of the curve length Si
S = zeros(1,m); S(1) = sqrt( (X(1)-X(m))^2 + (Y(1)-Y(m))^2 );
for i=2:m, S(i) = S(i-1) + sqrt( (X(i)-X(i-1))^2 + (Y(i)-Y(i-1))^2 ); end
L = S(m); % L - perimeter length
% computation of the angular function
wnd = 10; A = zeros(1,m);
for i=1:m
    % averaging of the pixel positions on a window of size wnd in order to reduce the noise
    x1=0; x2=0; y1=0; y2=0;
    for j=1:wnd
        pa = i-j; pb = i+j; if(pa<1), pa=m+pa; end, if(pb>m), pb=pb-m; end
        x1=x1+X(pa); y1=y1+Y(pa); x2=x2+X(pb); y2=y2+Y(pb);
    end
    x1=x1/wnd; y1=y1/wnd;  x2=x2/wnd; y2=y2/wnd;
    %computation of the angular function at the boundary point i
    dx=x2-x1;   dy=y2-y1;
    if(dx==0) dx=.00001; end
    if ( (dx>0) && (dy>0)), A(i)=atan(dy/dx);
    elseif ((dx>0) && (dy<0)), A(i)=atan(dy/dx)+2*pi;
    elseif A(i) == atan(dy/dx)+pi; end
end
subplot(2,3,2); plot(S,A); axis([0,S(m),-1,2*pi+1]); title('\phi(s)')

%comptation of the cumulative angular function
G = zeros(1,m);
for i = 2:m
    dA = A(i)-A(i-1); d = min(abs(dA), abs(abs(dA)-2*pi));
    if (d > 0.5),     G(i) = G(i-1);
    elseif (dA < -pi), G(i) = G(i-1) - (dA + 2*pi);
    elseif (dA > -pi), G(i) = G(i-1) - (dA - 2*pi);
    else, G(i) = G(i-1) - dA; end
end
subplot(2,3,3); plot(S,G); axis([0,S(m),-2*pi-1,1]); title('Cumulative angular function \gamma(s)')
t=(2*pi*S)/L; F = G + t;
subplot(2,3,4);
plot(t,F); axis([0,2*pi,-2*pi,2*pi]); title('Normalized cumulative angular function\gamma^*(t)')

% computation of the Fourier descriptors
a = zeros(1,nc); b = zeros(1,nc);
for k = 1:nc
    a(k) = a(k) + G(1)*(S(1))*cos(2*pi*k*S(1)/L);
    b(k) = b(k) + G(1)*(S(1))*sin(2*pi*k*S(1)/L);
    for i = 2:m
        a(k) = a(k) + G(i)*(S(i)-S(i-1))*cos(2*pi*k*S(i)/L);
        b(k) = b(k) + G(i)*(S(i)-S(i-1))*sin(2*pi*k*S(i)/L);
    end
    a(k) = a(k)*(2/L); b(k) = b(k)*(2/L)-2/k;
end
subplot(2,3,5); bar(a); title('Fourier descriptors a_k'), subplot(2,3,6); bar(b); title('Fourier descriptors b_k')

