% app refers to apply
% adm refers to admit
% mat refers to matriculant
% int refers to international
% tot is the total including international
% nlna refers to neither legacy nor athlete
% la refers to legacy or athlete
% dom refers to domestic
% all data can be found in DO42.pdf

load Data/harvardaggworknorace

appint       = basedata(:,1);
apptot       = basedata(:,2);
admint       = basedata(:,3);
admtot       = basedata(:,4);
matint       = basedata(:,5);
mattot       = basedata(:,6);
appnlnaint   = basedata(:,7);
appnlnatot   = basedata(:,8);
admnlnaint   = basedata(:,9);
admnlnatot   = basedata(:,10);
matnlnaint   = basedata(:,11);
matnlnatot   = basedata(:,12);
satappint    = basedata(:,13);
satapptot    = basedata(:,14);
satadmint    = basedata(:,15);
satadmtot    = basedata(:,16);
satmatint    = basedata(:,17);
satmattot    = basedata(:,18);
applaint     = basedata(:,19);
applatot     = basedata(:,20);
admlaint     = basedata(:,21);
admlatot     = basedata(:,22);
matlaint     = basedata(:,23);
matlatot     = basedata(:,24);
appdom       = basedata(:,25);
admdom       = basedata(:,26);
matdom       = basedata(:,27);
appnlnadom   = basedata(:,28);
admnlnadom   = basedata(:,29);
matnlnadom   = basedata(:,30);
appladom     = basedata(:,31);
admladom     = basedata(:,32);
matladom     = basedata(:,33);
appshrlatot  = basedata(:,34);
admshrlatot  = basedata(:,35);
matshrlatot  = basedata(:,36);
appshrladom  = basedata(:,37);
admshrladom  = basedata(:,38);
matshrladom  = basedata(:,39);
admrtlaint   = basedata(:,40);
admrtlatot   = basedata(:,41);
admrtladom   = basedata(:,42);
admrtnlnaint = basedata(:,43);
admrtnlnatot = basedata(:,44);
admrtnlnadom = basedata(:,45);
matrtlaint   = basedata(:,46);
matrtlatot   = basedata(:,47);
matrtladom   = basedata(:,48);
matrtnlnaint = basedata(:,49);
matrtnlnatot = basedata(:,50);
matrtnlnadom = basedata(:,51);
year=[2000:2017]';
save Data/overallAdmRates admrtnlnadom admrtladom appdom admdom


%create Figure 1
nlnagrow=(appnlnadom./appnlnadom(1))-1;
lagrow=(appladom./appladom(1))-1;
applicationsfig(year,[lagrow nlnagrow]);

%create Figure 2(a)
[b,bint]=regress(appladom./appdom,[ones(18,1) year-2000]);
pappsrat=[ones(18,1) year-2000]*b;
[b,bint]=regress(admladom./admdom,[ones(18,1) year-2000]);
padmsrat=[ones(18,1) year-2000]*b;
lanlnafig(year,[appladom./appdom pappsrat],[admladom./admdom padmsrat])

%create Figure 2(b)
[b,bint]=regress(admrtladom./admrtnlnadom,[ones(18,1) year-2000]);
prat=[ones(18,1) year-2000]*b;
admitratiofig(year,[admrtladom./admrtnlnadom prat])

%create Figure 3
matricfig(year,[matrtladom matrtnlnadom])