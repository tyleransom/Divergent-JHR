% app refers to apply
% adm refers to admit
% mat refers to matriculant
% int refers to international
% tot is the total including international
% nlna refers to neither legacy nor athlete
% la refers to legacy or athlete
% dom refers to domestic
% all data can be found in DO42.pdf

clear; clc;
load Data/harvardaggworkBYrace

year=[2000:2017]';

%code to create each panel of Figure 6

%Asian (panel a)
[b,bint]=regress(shareappLA1,[ones(18,1) year-2000]);
pappsrat=[ones(18,1) year-2000]*b;
[b,bint]=regress(shareadmLA1,[ones(18,1) year-2000]);
padmsrat=[ones(18,1) year-2000]*b;
lanlnafigBYrace(year,[shareappLA1 pappsrat],[shareadmLA1 padmsrat],'Asian')

%Black (panel b)
[b,bint]=regress(shareappLA2,[ones(18,1) year-2000]);
pappsrat=[ones(18,1) year-2000]*b;
[b,bint]=regress(shareadmLA2,[ones(18,1) year-2000]);
padmsrat=[ones(18,1) year-2000]*b;
lanlnafigBYrace(year,[shareappLA2 pappsrat],[shareadmLA2 padmsrat],'Black')

%Hispanic (panel c)
[b,bint]=regress(shareappLA3,[ones(18,1) year-2000]);
pappsrat=[ones(18,1) year-2000]*b;
[b,bint]=regress(shareadmLA3,[ones(18,1) year-2000]);
padmsrat=[ones(18,1) year-2000]*b;
lanlnafigBYrace(year,[shareappLA3 pappsrat],[shareadmLA3 padmsrat],'Hispanic')

%White+Unknown (panel d)
[b,bint]=regress(shareappLA8,[ones(18,1) year-2000]);
pappsrat=[ones(18,1) year-2000]*b;
[b,bint]=regress(shareadmLA8,[ones(18,1) year-2000]);
padmsrat=[ones(18,1) year-2000]*b;
lanlnafigBYrace(year,[shareappLA8 pappsrat],[shareadmLA8 padmsrat],'WhitePlusUnknown')

%White (Appendix Figure B1)
[b,bint]=regress(shareappLA7,[ones(18,1) year-2000]);
pappsrat=[ones(18,1) year-2000]*b;
[b,bint]=regress(shareadmLA7,[ones(18,1) year-2000]);
padmsrat=[ones(18,1) year-2000]*b;
lanlnafigBYrace(year,[shareappLA7 pappsrat],[shareadmLA7 padmsrat],'White')
