function hfig = f_format_figure(hfig)

% To reshape the panels into a uniform format

% hfig = open('./svFigs/DE_vs_order.fig');

%% format figure
hfig.Units = 'centimeters';
hfig.Position = [4.5 1.0 15.0 15];

%% axis
haxis = gca;

haxis.FontSize = 12;
% haxis.XTick = 0 : 2e5/1000 : 10e5/1000;

haxis.Units = 'centimeters';
haxis.Position=[1.9514 8.771 5 5];

haxis.Box = 'on';
haxis.TickLength = [0.02 0.035]*1.5;

haxis.LineWidth = 1.2;

% %% save
% saveas(gcf,[hfig.FileName,'_formatted'],'fig')
