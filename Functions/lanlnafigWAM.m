function createfigure(X1, YMatrix1, YMatrix2)
%CREATEFIGURE(X1, YMatrix1, YMatrix2)
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data
%  YMATRIX2:  matrix of y data

%  Auto-generated by MATLAB on 19-Apr-2019 11:08:05

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Activate the left side of the axes
yyaxis(axes1,'left');
% Create multiple lines using matrix input to plot
plot1 = plot(X1,YMatrix2);
set(plot1(1),'DisplayName','Admits (Data & Linear Prediction)','LineStyle','-','LineWidth',1,'Color',[0.9 0.9 0.9]);
set(plot1(2),'DisplayName','Admits (Linear Prediction, Left Axis)','LineStyle','-','LineWidth',1,'Color',[0 0 0]);
% Create ylabel
ylabel('LA Share of Admits');
% Set the remaining axes properties
set(axes1,'YColor',[0 0 0]);

% Activate the right side of the axes
yyaxis(axes1,'right');
% Create multiple lines using matrix input to plot
plot2 = plot(X1,YMatrix1);
set(plot2(1),'DisplayName','Applications (Data & Linear Prediction)','LineStyle','--','LineWidth',1,'Color',[0.9 0.9 0.9]);
set(plot2(2),'DisplayName','Applications (Linear Prediction, Right Axis)','LineStyle','--','LineWidth',1,'Color',[0 0 0]);
% text(2008,0.042,'Applications (Data & Linear Prediction)');
% text(2001,0.052,'Admits (Data & Linear Pred)');
legend([plot1(2),plot2(2)]); % Only display first legend title
% Create ylabel
ylabel('LA Share of Applications','Rotation',90);
% Set the remaining axes properties
%set(axes1,'YColor',[0.450 0.450 0.450]);
set(axes1,'YColor',[0 0 0]);

% Create xlabel
xlabel('Harvard Class');

% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[2000 2017]);
box(axes1,'on');
% Set the remaining axes properties
set(axes1,'LineStyleOrderIndex',3,'ZColor',[1 1 0]);
% Create legend
legend(axes1,'show');

% Save as pdf fit to image size
set(gcf,'Units','inches');
screenposition = get(gcf,'Position');
set(gcf,...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize',[screenposition(3:4)]);
print -dpdf -painters FiguresAndTables/lanlnaWAM


