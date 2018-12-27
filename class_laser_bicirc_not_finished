classdef class_laser_bicirc
    %CLASS_LASER_BICIRC bicircular laser field
    %   �˴���ʾ��ϸ˵��
    
    properties
        intensity    % intensity of the total pulse
        E0           % amplitude in one direction of the two colors
        E1
        
        wavelength1_nm     % wavelength in nm
        wavelength1        % wavelength in meter
        wavelength2_nm     
        wavelength2       
        w0           % angular frequency of the two colors
        w1
        T            % otical cycle for w0
        Ncycle        % number of optical cycles in the pulse length
        
        r1           % for the ratio of intensity of the two colors
        r2
        
        Ext
        Eyt
        absEt
        
        ft           % envelope
        pulse_shape
        
      
    end
    
    methods
        %%  constructor
        function obj=class_laser_bicirc(intensity,r1,r2,wavelength1_nm,wavelength2_nm,t,pulse_shape)
            obj.intensity = intensity;
            obj.r1 = r1;
            obj.r2 = r2;
            obj.wavelength1_nm = wavelength1_nm;
            obj.wavelength2_nm = wavelength2_nm;
            obj.ft = ft;
            
            I = intensity/2 * ( r1/(r1+r2) );      %the intense of the laser field
            I1= intensity/2 * ( r2/(r1+r2) );     % don't forget /2 because it is circuarly polarized
            
            [obj.w0,obj.w1,obj.E0,obj.E1]=obj.atomic(bochang0,bochang1,I,I1);
            
            obj.T = 2*pi/obj.w0;  
            tmax = max(t);
            obj.Ncycle = tmax/obj.T;
            
        end
        
         function  [w0,w1,E0e,E1]=atomic(bochang0,bochang1,I,I1)
            c=2.997925e8;
            e0=1.602192e-19;
            h0=6.62620e-34;
            hbar=h0/2/pi;
            epsilin0=8.8542e-12;
            m0=9.10956e-31;
            es0=e0^2/4/pi/epsilin0;
            L0=hbar^2/m0/es0;
            T0=hbar^3/m0/es0^2;
            Ee0=es0^2*m0/hbar^2/L0/e0;  %electrical field by v/m^2
            V0=L0/T0;
            ii=1e5*Ee0/L0;
            %-------atomic units-------%
            5e-15/T0;
            bochang=bochang0/L0;
            bochang1=bochang1/L0;
            w1=2*pi*c/V0/bochang1;
            w0=2*pi*c/V0/bochang;
            E0e=2740*sqrt(I)/Ee0;
            E1=2740*sqrt(I1)/Ee0;
            
        end
        
    end
    
end
