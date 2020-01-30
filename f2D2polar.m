function [vec_theta, output ] = f2D2polar( Lx, Ly, Rx, Ry, D, Ntheta )

% f2D2polar Convert the 2D distrbution in x-y coordingate into polar
% Ntheta determins how many points are obtained in the range [-pi, pi).
% NOTE THAT either -pi or pi is not included.
% e.g. pi is exluded here.
  

% load sv_gs_outputs.mat;

%% the spacial grid
x=linspace(-Rx,Rx,Lx);
y=linspace(-Ry,Ry,Ly);

[mx,my] = meshgrid(x,y);

% figure; scatter(reshape(mx,1,[]),reshape(my,1,[]));

%% transform to polar coordinates
mth = atan2(my,mx);
mr = hypot(mx,my);

% figure; scatter(reshape(mth,1,[]),reshape(mr,1,[]));

%% initalize the output vs theta
output = zeros(1, Ntheta);

dtheta = 2*pi/Ntheta;     

vec_theta = -pi:dtheta:-pi+dtheta*(Ntheta-1);

%% count one by one
for m=1:Lx
    for n=1:Ly
   
        index = floor( (mth(m,n)+pi)/dtheta )+1;    % Because the indext in Matlab begins from 1.
        
        output(index) = output(index) + D(m,n);
        
    end 

end % end of m

output = output * dtheta;


    
    
% %% plot
%    
%     figure;
%     subplot(121)
%     pcolor(x,y,D);
%     subplot(122)
%     polar(vec_theta, output);


