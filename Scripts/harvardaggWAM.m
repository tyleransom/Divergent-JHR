% app refers to apply
% adm refers to admit
% mat refers to matriculant
% int refers to international
% tot is the total including international
% nlna refers to neither legacy nor athlete
% la refers to legacy or athlete
% dom refers to domestic
% all data can be found in DO42.pdf

load Data/harvardaggworknoraceWAM

year=[2000:2017]';

%code to create Figure 1 (white/Asian/Missing) [not included in paper]
nlnagrow=(appnlnadomWAM./appnlnadomWAM(1))-1;
lagrow=(appladomWAM./appladomWAM(1))-1;
applicationsfigWAM(year,[lagrow nlnagrow]);

%code to create Figure 5(a) (white/Asian/Missing)
[b,bint]=regress(appladomWAM./appdomWAM,[ones(18,1) year-2000]);
pappsrat=[ones(18,1) year-2000]*b;
[b,bint]=regress(admladomWAM./admdomWAM,[ones(18,1) year-2000]);
padmsrat=[ones(18,1) year-2000]*b;
lanlnafigWAM(year,[appladomWAM./appdomWAM pappsrat],[admladomWAM./admdomWAM padmsrat])

%code to create Figure 5(b) (white/Asian/Missing)
[b,bint]=regress(admrtladomWAM./admrtnlnadomWAM,[ones(18,1) year-2000]);
prat=[ones(18,1) year-2000]*b;
admitratiofigWAM(year,[admrtladomWAM./admrtnlnadomWAM prat])

 
