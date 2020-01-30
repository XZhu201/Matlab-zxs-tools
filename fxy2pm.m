function [ up, um ] = fxy2pm( ux, uy )
%FXY2PM transfer the x,y orbitals to the +,- orbitals
%   

up = (ux+1i*uy)/sqrt(2);
um = (ux-1i*uy)/sqrt(2);


end

