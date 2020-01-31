function [angle] = f_angle_intertia_tensor_sinh(x,y,dru,a,data2D)

%% calculate the angle !!!!
        
% I only need to calculate and diagonize the intertia tensor in 2D
% (in the x-y plane). 

% If you find it difficult to understand, just assume I have
% a thin plate in the x-y plane. Therefore, when calculating the 
% elements in the intertia tensor,I only need to do the sum 
% in the x,y plane, i.e. considreing z=0 only.
% Then, Ixz, Izx, Iyz, Izy are all 0.

% I only need to consider the sub-matrix formed by in the first
% rows and columns as
% [Ixx, Ixy, 0  ]
% [Iyx, Iyy, 0  ]
% [0,   0,   Izz]


% prepare the grid
[mx2,my2]=meshgrid(x,y);

% 
prexyz_insum = sqrt(1+mx2.^2)/a.*sqrt(1+my2.^2)/a;
sum2dr = @(A) sum(sum(A.*prexyz_insum))*dru*dru;

% for the elements
temp_sum = data2D.*(my2.^2);
Ixx = sum2dr( temp_sum );

temp_sum = data2D.*(mx2.^2);
Iyy = sum2dr( temp_sum );    

temp_sum = -mx2.*my2.*data2D;
Ixy = sum2dr( temp_sum );
Iyx = Ixy;

Itensor = [Ixx, Ixy; Iyx, Iyy];

[vv,dd]=eigs(Itensor,2,'smallestabs');

angle= atan( vv(2,1)/vv(1,1) );