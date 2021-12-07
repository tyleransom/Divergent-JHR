% app refers to apply
% adm refers to admit
% mat refers to matriculant
% groups are defined as follows:
% 1 Asian American
% 2 African American
% 3 Hispanic American
% 4 Native American / Pacific Islander
% 5 Other
% 6 Unknown
% 7 White
% 8 International
% 9 Total
% all data can be found in DO42.pdf

clear; clc;
load Data/harvardSAT

SATtot = SATdata(SATdata(:,2)==9,:);
year = SATtot(:,1);
admtot = SATtot(:,4);
apptot = SATtot(:,3);

SATappblack = SATdata(SATdata(:,2)==2,3);
SATapphispa = SATdata(SATdata(:,2)==3,3);
SATappasian = SATdata(SATdata(:,2)==1,3);
SATappwhite = SATdata(SATdata(:,2)==7,3);

%create Figure 4
SATallappfig(year,[SATappblack SATapphispa SATappasian SATappwhite]);

