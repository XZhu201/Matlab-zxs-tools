classdef ztl
    %ZTL Zxs useful TooLs
    %   2018-12-18
    
    properties
        % NOTHING
    end
    
    methods(Static)
        
        %% atomic
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
        
        % -----------------------------------------------------------------
        
        %% createfigure_log10
        function createfigure_log10(ZData1, YData1, XData1, CData1, BoxSize)
            %CREATEFIGURE2(ZDATA1,YDATA1,XDATA1,CDATA1)
            %  ZDATA1:  surface zdata
            %  YDATA1:  surface ydata
            %  XDATA1:  surface xdata
            %  CDATA1:  surface cdata
            
            %  Auto-generated by MATLAB on 16-Nov-2011 20:40:01
            
            % Create figure
            figure1 = figure('Colormap',...
                [1 1 1;1 1 1;1 1 1;1 1 1;1 1 1;0.949999988079071 0.974901974201202 0.949999988079071;0.899999976158142 0.949803948402405 0.899999976158142;0.850000023841858 0.924705862998962 0.850000023841858;0.800000011920929 0.899607837200165 0.800000011920929;0.75 0.874509811401367 0.75;0.699999988079071 0.84941178560257 0.699999988079071;0.649999976158142 0.824313700199127 0.649999976158142;0.600000023841858 0.79921567440033 0.600000023841858;0.550000011920929 0.774117648601532 0.550000011920929;0.5 0.749019622802734 0.5;0.449999988079071 0.723921597003937 0.449999988079071;0.400000005960464 0.698823511600494 0.400000005960464;0.349999994039536 0.673725485801697 0.349999994039536;0.300000011920929 0.648627460002899 0.300000011920929;0.25 0.623529434204102 0.25;0.200000002980232 0.598431348800659 0.200000002980232;0.150000005960464 0.573333323001862 0.150000005960464;0.100000001490116 0.548235297203064 0.100000001490116;0.0500000007450581 0.523137271404266 0.0500000007450581;0 0.498039215803146 0;0.0434782616794109 0.519863605499268 0;0.0869565233588219 0.541687965393066 0;0.130434781312943 0.56351238489151 0;0.173913046717644 0.585336744785309 0;0.217391297221184 0.607161104679108 0;0.260869562625885 0.628985524177551 0;0.304347813129425 0.65080988407135 0;0.347826093435287 0.672634243965149 0;0.391304343938828 0.694458663463593 0;0.434782594442368 0.716283023357391 0;0.47826087474823 0.738107442855835 0;0.52173912525177 0.759931802749634 0;0.56521737575531 0.781756162643433 0;0.60869562625885 0.803580582141876 0;0.652173936367035 0.825404942035675 0;0.695652186870575 0.847229301929474 0;0.739130437374115 0.869053721427917 0;0.782608687877655 0.890878081321716 0;0.826086938381195 0.91270250082016 0;0.869565188884735 0.934526860713959 0;0.91304349899292 0.956351220607758 0;0.95652174949646 0.978175640106201 0;1 1 0;1 0.899999976158142 0;1 0.800000011920929 0;1 0.699999988079071 0;1 0.600000023841858 0;1 0.5 0;1 0.400000005960464 0;1 0.300000011920929 0;1 0.200000002980232 0;1 0.100000001490116 0;1 0 0;0.916666686534882 0 0;0.833333313465118 0 0;0.75 0 0;0.666666686534882 0 0;0.583333313465118 0 0;0.5 0 0]);
            
            % Create axes
            axes1 = axes('Parent',figure1,'CLim',[-6.2524 -0.5]);
            % Uncomment the following line to preserve the X-limits of the axes
            xlim(axes1,[-BoxSize BoxSize]);
            % Uncomment the following line to preserve the Y-limits of the axes
            ylim(axes1,[-BoxSize BoxSize]);
            box(axes1,'on');
            hold(axes1,'all');
            
            % Create surface
            surface('Parent',axes1,'ZData',ZData1,'YData',YData1,'XData',XData1,...
                'FaceColor','interp',...
                'EdgeColor','none',...
                'CData',CData1);
            
            % Create title
            % title('ground state');
            
        end % end of createfigure_log10
        
        % -----------------------------------------------------------------
        
        %% disp
        function disp(val)
            if isscalar(val)
                fprintf('%s = %f \n',inputname(1),val);
            elseif ischar(val)
                fprintf('%s = %s \n',inputname(1),val);
            else
                disp([inputname(1),' = ']),disp(val);
            end
        end
        % end of disp
        
        % -----------------------------------------------------------------
        
        function fig2gif(list_num,str_head,str_tail)
            % list_num choose the files with listed number to be read
            % str_head is the string before number in the file names
            % str_tail is the string after the number in the file names
            
            % also remember to set the [format of the numbers] and the [delay] below
            
            delay = 60/length(list_num);   % set the delay, so that the movie lasts for 60 s
            
            str_first = num2str( list_num(1) );
            str_step = num2str( list_num(2)-list_num(1) );
            str_end = num2str( list_num(end) );
            
            str_save_name = [str_head,'_',str_first,'_',str_step,'_',str_end,'_',str_tail,'.gif'];
            
            for i=list_num
                str_num = num2str(i, '%d');        % may need to set the format of the number
                str = [str_head,str_num,str_tail];
                fprintf('Reading %s ... \n',str);
                
                A=imread(str);
                [I,map]=rgb2ind(A,256);
                if(i==list_num(1))
                    imwrite(I,map,str_save_name,'DelayTime',delay,'LoopCount',Inf)
                else
                    imwrite(I,map,str_save_name,'WriteMode','append','DelayTime',delay)
                end
                %     set(gcf,'outerposition',get(0,'screensize'));  % max the matlab window
                
            end
            
            fprintf('\nDone! Movie saved to %s.\n',str_save_name)
            
        end % end of fig2gif
        
        % -----------------------------------------------------------------
        
        function fig2mov(list_num,str_head,str_tail)
            % list_num choose the files with listed number to be read
            % str_head is the string before number in the file names
            % str_tail is the string after the number in the file names
            
            % also remember to set the [format of the numbers] and the [fps] below
            % It is possible to change the format of the movie, see http://blog.sciencenet.cn/blog-2824237-991962.html
            
            fps = length(list_num)/60 ;       % set the fps, so that the movie lasts for 60 s
            
            str_first = num2str( list_num(1) );
            str_step = num2str( list_num(2)-list_num(1) );
            str_end = num2str( list_num(end) );
            
            str_save_name = [str_head,'_',str_first,'_',str_step,'_',str_end,'_',str_tail,'.avi'];
            
            aviobj=VideoWriter(str_save_name);     % build a .avi file
            aviobj.FrameRate=fps;                  % set fps
            
            open(aviobj);                          % Open file for writing video data
            
            for i=list_num
                str_num = num2str(i, '%d');        % may need to set the format of the number
                str = [str_head,str_num,str_tail];
                fprintf('Reading %s ... \n',str);
                
                frames=imread(str);                % read the figure
                writeVideo(aviobj,frames);
            end
            
            close(aviobj);                         % close the .avi file
            fprintf('\nDone! Movie saved to %s.\n',str_save_name)
            
        end % end of fig2mov
        
        % Modified based on the code of Zhang Xiaofan
        % If needed, check how to set the format in num2str by "doc num2str" in
        % MATLAB.
        
        % Example to use: if you want to load files as:
        
        % laser800nm.png
        % laser1000nm.png
        % ......
        % laser3000nm.png
        
        % call the function like this:
        % fig2mov([800:200:3000],'laser','nm.png')
        
        % -----------------------------------------------------------------
        
    end  % end of methods (Static)
end
