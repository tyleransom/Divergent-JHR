function createfigure(X1, YMatrix1)
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(X1,YMatrix1,...
    'Color',[0 0 0]);
set(plot1(1));
set(plot1(2),'LineStyle','--');
text(2012,0.2,'Harvard');
text(2009,1.2,'Other Ivies (Average)');

% Create ylabel
ylabel('Growth Rate in Applications');

% Create xlabel
xlabel('Harvard Class');

% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[2005 2021]);
box(axes1,'on');
% Create legend
%legend1 = legend(axes1,'show');
%set(legend1,...
%    'Position',[0.686607142857142 0.852380952380953 0.2125 0.0630952380952381]);

% Save as pdf fit to image size
set(gcf,'Units','inches');
screenposition = get(gcf,'Position');
set(gcf,...
    'PaperPosition',[0 0 screenposition(3:4)],...
    'PaperSize',[screenposition(3:4)]);
print -dpdf -painters FiguresAndTables/applicationgrowth1Ivy
%The first two lines measure the size of your figure (in inches). The next line configures the print paper size to fit the figure size. The last line uses the print command and exports a vector pdf document as the output.

