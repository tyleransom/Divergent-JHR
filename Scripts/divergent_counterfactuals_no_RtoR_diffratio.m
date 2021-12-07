clear
clc
delete('Logs/divergent_counterfactuals_no_RtoR_diffratio.diary');
diary('Logs/divergent_counterfactuals_no_RtoR_diffratio.diary');
diary on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup variables to capture status quo in 2015-2017
% Values below are based on calculations from SFFA v. Harvard Trial Exhibit DX 042.  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global w_l_app w_nl_app b_l_app b_nl_app h_l_app h_nl_app a_l_app a_nl_app u_l_app u_nl_app o_l_app o_nl_app
global w_l_index w_nl_index b_l_index b_nl_index h_l_index h_nl_index a_l_index a_nl_index u_l_index u_nl_index o_l_index o_nl_index

% get growth rate in white NLNA applications from 2000 to 2008
% compare that with growth rate in black NLNA applications over same period

disp('Annual growth rates in applications (2000-2008) for W, A, B');
wnlna_app = [6363; 5475; 5926; 6902; 6664; 6694; 7814; 8185; 7446; 7799; 7033; 6904; 7920; 8529; 10659; 11659; 10591; 10690];
anlna_app = [3642; 3259; 3278; 3493; 3584; 3675; 3970; 4397; 4233; 4741; 4812; 4731; 5295; 5702; 6778; 7666; 6904; 7021];
bnlna_app = [915; 869; 944; 1031; 1131; 1100; 1164; 1227; 1210; 1657; 1916; 1986; 2705; 2914; 2887; 3559; 3271; 3363];
hnlna_app = [1119; 1089; 1115; 1249; 1153; 1378; 1368; 1658; 1648; 1875; 2039; 2140; 2633; 2932; 2991; 3552; 3409; 3460];
wgth = [ones(9,1) [0:8]']\wnlna_app(1:9);
agth = [ones(9,1) [0:8]']\anlna_app(1:9);
bgth = [ones(9,1) [0:8]']\bnlna_app(1:9);
hgth = [ones(9,1) [0:8]']\hnlna_app(1:9);
wgth(end)
agth(end)
bgth(end)
hgth(end)

agthall = [ones(18,1) [0:17]']\anlna_app(1:18);
agthall(end)
bgthall = [ones(18,1) [0:17]']\bnlna_app(1:18);
bgthall(end)
hgthall = [ones(18,1) [0:17]']\hnlna_app(1:18);
hgthall(end)

% white NLNA grew by 267 apps/year from 2000-2008
% asian NLNA grew by 122 apps/year from 2000-2008
% black NLNA grew by  46 apps/year from 2000-2008
% latin NLNA grew by  74 apps/year from 2000-2008
% black-to-asian ratio is then 0.3762
% latin-to-asian ratio is then 0.6070

% asian NLNA grew by 249 apps/year from 2000-2017
% black NLNA grew by 171 apps/year from 2000-2017
% latin NLNA grew by 160 apps/year from 2000-2017
% black-to-asian ratio for the whole period is then 0.6879 -- ≈2x that of '00-'08
% latin-to-asian ratio for the whole period is then 0.6443 -- ≈same as    '00-'08

disp('Number of annual black and hispanic applicants in 2015-17 absent RtoR effect');
preda = agth(1)+17*agth(2);
preda_all = agthall(1)+17*agthall(2);
predb_all_cfl = round(bgthall(1)+17*agthall(2)*(bgth(2)/agth(2)))
predh_all_cfl = round(hgthall(1)+17*agthall(2)*(hgth(2)/agth(2)))

disp('Number of black and hispanic applicants post-2008 absent RtoR effect');
predb_vec_cfl = 3*round(bgthall(1)+[11 14 17]*agthall(2)*(bgth(2)/agth(2)))
predh_vec_cfl = 3*round(hgthall(1)+[11 14 17]*agthall(2)*(hgth(2)/agth(2)))

w_l_app=2243;
w_l_adm=946;
w_nl_app=32940;
w_nl_adm=1641;

b_l_app=213;
b_l_adm=91;
b_nl_app=predb_all_cfl*3; %6051 instead of 10193 (to correct for RtoR effect)
b_nl_adm=604;


h_l_app=170;
h_l_adm=74;
h_nl_app=predh_all_cfl*3; %9750 instead of 10421 (to correct for RtoR effect)
h_nl_adm=575;

a_l_app=320;
a_l_adm=151;
a_nl_app=21591;
a_nl_adm=1094;

u_l_app=301;
u_l_adm=116;
u_nl_app=6084;
u_nl_adm=291;

o_l_app=30;
o_l_adm=9;
o_nl_app=1011;
o_nl_adm=73;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate admissions indices that reconcile the above values
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

w_l_index=log((w_l_adm/w_l_app)/(1-(w_l_adm/w_l_app)));
w_nl_index=log((w_nl_adm/w_nl_app)/(1-(w_nl_adm/w_nl_app)));

b_l_index=log((b_l_adm/b_l_app)/(1-(b_l_adm/b_l_app)));
b_nl_index=log((b_nl_adm/b_nl_app)/(1-(b_nl_adm/b_nl_app)));

h_l_index=log((h_l_adm/h_l_app)/(1-(h_l_adm/h_l_app)));
h_nl_index=log((h_nl_adm/h_nl_app)/(1-(h_nl_adm/h_nl_app)));

a_l_index=log((a_l_adm/a_l_app)/(1-(a_l_adm/a_l_app)));
a_nl_index=log((a_nl_adm/a_nl_app)/(1-(a_nl_adm/a_nl_app)));

u_l_index=log((u_l_adm/u_l_app)/(1-(u_l_adm/u_l_app)));
u_nl_index=log((u_nl_adm/u_nl_app)/(1-(u_nl_adm/u_nl_app)));

o_l_index=log((o_l_adm/o_l_app)/(1-(o_l_adm/o_l_app)));
o_nl_index=log((o_nl_adm/o_nl_app)/(1-(o_nl_adm/o_nl_app)));

b = zeros(2,1);
disp('******Status Quo******')
w_l_adm=exp(w_l_index+b(1)+b(2))/(1+exp(w_l_index+b(1)+b(2)))*w_l_app;
w_nl_adm=exp(w_nl_index+b(1))/(1+exp(w_nl_index+b(1)))*w_nl_app;
white_admits=round(w_l_adm+w_nl_adm)
white_LA_share=w_l_adm/(w_l_adm+w_nl_adm)

b_l_adm=exp(b_l_index+b(1)+b(2))/(1+exp(b_l_index+b(1)+b(2)))*b_l_app;
b_nl_adm=exp(b_nl_index+b(1))/(1+exp(b_nl_index+b(1)))*b_nl_app;
black_admits=round(b_l_adm+b_nl_adm)
black_LA_share=b_l_adm/(b_l_adm+b_nl_adm)

h_l_adm=exp(h_l_index+b(1)+b(2))/(1+exp(h_l_index+b(1)+b(2)))*h_l_app;
h_nl_adm=exp(h_nl_index+b(1))/(1+exp(h_nl_index+b(1)))*h_nl_app;
hispanic_admits=round(h_l_adm+h_nl_adm)
hispanic_LA_share=h_l_adm/(h_l_adm+h_nl_adm)

a_l_adm=exp(a_l_index+b(1)+b(2))/(1+exp(a_l_index+b(1)+b(2)))*a_l_app;
a_nl_adm=exp(a_nl_index+b(1))/(1+exp(a_nl_index+b(1)))*a_nl_app;
asian_admits=round(a_l_adm+a_nl_adm)
asian_LA_share=a_l_adm/(a_l_adm+a_nl_adm)


options=optimset('TolFun',1e-20,'TolX',1e-20,'MaxFunEvals',10000,'Disp','Off');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Counterfactual 1 - Fix minority LA access
% Set the number of African American, Hispanic, and Asian legacy applicants
% to be the same share as in 2000-2002. Bump up the non-legacy application
% of the same race groups to keep total applications the same.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Using the adjusted LA application numbers below there are now 2,913 LA
%applicants in 2015-2017

b_l_app=143;   %this means 4.9% are African American 
b_nl_app=predb_all_cfl*3+(213-143);  % [number above]+(213-143)

h_l_app=64;    %this means 2.2% are Hispanic
h_nl_app=predh_all_cfl*3+(170-64);  % [number above]+(170-64)

a_l_app=134;   %this means 4.6% are Asian
a_nl_app=21777;   % 21591+(320-134)

% Find the new legacy bonus and intercept to maintain the legacy admit rate
% advantaage and capacity constraint
b=fminsearch('counter1',0.0,options)
feval('counter1',b)

% Using the admissions adjustments, calculate admits and shares
disp('******Counterfactual 1 (R to R correction)******')
w_l_adm=exp(w_l_index+b(1))/(1+exp(w_l_index+b(1)))*w_l_app;
w_nl_adm=exp(w_nl_index+b(1))/(1+exp(w_nl_index+b(1)))*w_nl_app;
white_admits=round(w_l_adm+w_nl_adm)
white_LA_share=w_l_adm/(w_l_adm+w_nl_adm)

b_l_adm=exp(b_l_index+b(1))/(1+exp(b_l_index+b(1)))*b_l_app;
b_nl_adm=exp(b_nl_index+b(1))/(1+exp(b_nl_index+b(1)))*b_nl_app;
black_admits=round(b_l_adm+b_nl_adm)
black_LA_share=b_l_adm/(b_l_adm+b_nl_adm)

h_l_adm=exp(h_l_index+b(1))/(1+exp(h_l_index+b(1)))*h_l_app;
h_nl_adm=exp(h_nl_index+b(1))/(1+exp(h_nl_index+b(1)))*h_nl_app;
hispanic_admits=round(h_l_adm+h_nl_adm)
hispanic_LA_share=h_l_adm/(h_l_adm+h_nl_adm)

a_l_adm=exp(a_l_index+b(1))/(1+exp(a_l_index+b(1)))*a_l_app;
a_nl_adm=exp(a_nl_index+b(1))/(1+exp(a_nl_index+b(1)))*a_nl_app;
asian_admits=round(a_l_adm+a_nl_adm)
asian_LA_share=a_l_adm/(a_l_adm+a_nl_adm)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Counterfactual 2 - Return LA preferences back to 2000
% Alter the legacy advantage so that admit rate ratio is 4.15.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% reset the URM application numbers back to their 2015 values
b_l_app=213;
b_nl_app=predb_all_cfl*3;
h_l_app=170;
h_nl_app=predh_all_cfl*3;;
a_l_app=320;
a_nl_app=21591;

fid = fopen('FiguresAndTables/counter2noRtoRratio.tex', 'w');
for jjj=[4.15:.5:8.15]
    b=fminsearch('counter2ratio',[0.0;0.0],options,jjj)
    feval('counter2ratio',b,jjj)

    % Using the admissions adjustments, calculate admits and shares
    disp('******Counterfactual 2******')
    disp(['LA bonus = ',num2str(jjj)])
    w_l_adm=exp(w_l_index+b(1)+b(2))/(1+exp(w_l_index+b(1)+b(2)))*w_l_app;
    w_nl_adm=exp(w_nl_index+b(1))/(1+exp(w_nl_index+b(1)))*w_nl_app;
    white_admits=round(w_l_adm+w_nl_adm);
    white_LA_share=w_l_adm/(w_l_adm+w_nl_adm);

    b_l_adm=exp(b_l_index+b(1)+b(2))/(1+exp(b_l_index+b(1)+b(2)))*b_l_app;
    b_nl_adm=exp(b_nl_index+b(1))/(1+exp(b_nl_index+b(1)))*b_nl_app;
    black_admits=round(b_l_adm+b_nl_adm);
    black_LA_share=b_l_adm/(b_l_adm+b_nl_adm);

    h_l_adm=exp(h_l_index+b(1)+b(2))/(1+exp(h_l_index+b(1)+b(2)))*h_l_app;
    h_nl_adm=exp(h_nl_index+b(1))/(1+exp(h_nl_index+b(1)))*h_nl_app;
    hispanic_admits=round(h_l_adm+h_nl_adm);
    hispanic_LA_share=h_l_adm/(h_l_adm+h_nl_adm);

    a_l_adm=exp(a_l_index+b(1)+b(2))/(1+exp(a_l_index+b(1)+b(2)))*a_l_app;
    a_nl_adm=exp(a_nl_index+b(1))/(1+exp(a_nl_index+b(1)))*a_nl_app;
    asian_admits=round(a_l_adm+a_nl_adm);
    asian_LA_share=a_l_adm/(a_l_adm+a_nl_adm);
    fprintf(fid, 'Bonus');
    fprintf(fid, ' & ');
    fprintf(fid,'%3.2f',jjj); 
    fprintf(fid, ' & ');
    fprintf(fid,'%7.0f',white_admits); 
    fprintf(fid, ' & ');
    fprintf(fid,'%4.3f',white_LA_share); 
    fprintf(fid, ' & ');
    fprintf(fid,'%7.0f',black_admits); 
    fprintf(fid, ' & ');
    fprintf(fid,'%4.3f',black_LA_share); 
    fprintf(fid, ' & ');
    fprintf(fid,'%7.0f',hispanic_admits); 
    fprintf(fid, ' & ');
    fprintf(fid,'%4.3f',hispanic_LA_share); 
    fprintf(fid, ' & ');
    fprintf(fid,'%7.0f',asian_admits); 
    fprintf(fid, ' & ');
    fprintf(fid,'%4.3f',asian_LA_share); 
    fprintf(fid, ' \\\\\n');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Counterfactual 3 - Return LA preferences back to 2000 and the share or
% URM that are legacy
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b_l_app=143;   %this means 4.9% are African American 
b_nl_app=predb_all_cfl*3+(213-143);  % [number above]+(213-143)

h_l_app=64;    %this means 2.2% are Hispanic
h_nl_app=predh_all_cfl*3+(170-64);  % [number above]+(170-64)

a_l_app=134;   %this means 4.6% are Asian
a_nl_app=21777;   % 21591+(320-134)


fid = fopen('FiguresAndTables/counter3noRtoRratio.tex', 'w');
for jjj=[4.15:.5:8.15]
    b=fminsearch('counter3ratio',[0.0;0.0],options,jjj)
    feval('counter3ratio',b,jjj)

    % Using the admissions adjustments, calculate admits and shares
    disp('******Counterfactual 3******')
    disp(['LA bonus = ',num2str(jjj)])
    w_l_adm=exp(w_l_index+b(1)+b(2))/(1+exp(w_l_index+b(1)+b(2)))*w_l_app;
    w_nl_adm=exp(w_nl_index+b(1))/(1+exp(w_nl_index+b(1)))*w_nl_app;
    white_admits=round(w_l_adm+w_nl_adm);
    white_LA_share=w_l_adm/(w_l_adm+w_nl_adm);

    b_l_adm=exp(b_l_index+b(1)+b(2))/(1+exp(b_l_index+b(1)+b(2)))*b_l_app;
    b_nl_adm=exp(b_nl_index+b(1))/(1+exp(b_nl_index+b(1)))*b_nl_app;
    black_admits=round(b_l_adm+b_nl_adm);
    black_LA_share=b_l_adm/(b_l_adm+b_nl_adm);

    h_l_adm=exp(h_l_index+b(1)+b(2))/(1+exp(h_l_index+b(1)+b(2)))*h_l_app;
    h_nl_adm=exp(h_nl_index+b(1))/(1+exp(h_nl_index+b(1)))*h_nl_app;
    hispanic_admits=round(h_l_adm+h_nl_adm);
    hispanic_LA_share=h_l_adm/(h_l_adm+h_nl_adm);

    a_l_adm=exp(a_l_index+b(1)+b(2))/(1+exp(a_l_index+b(1)+b(2)))*a_l_app;
    a_nl_adm=exp(a_nl_index+b(1))/(1+exp(a_nl_index+b(1)))*a_nl_app;
    asian_admits=round(a_l_adm+a_nl_adm);
    asian_LA_share=a_l_adm/(a_l_adm+a_nl_adm);
    fprintf(fid, 'Bonus');
    fprintf(fid, ' & ');
    fprintf(fid,'%3.2f',jjj); 
    fprintf(fid, ' & ');
    fprintf(fid,'%7.0f',white_admits); 
    fprintf(fid, ' & ');
    fprintf(fid,'%4.3f',white_LA_share); 
    fprintf(fid, ' & ');
    fprintf(fid,'%7.0f',black_admits); 
    fprintf(fid, ' & ');
    fprintf(fid,'%4.3f',black_LA_share); 
    fprintf(fid, ' & ');
    fprintf(fid,'%7.0f',hispanic_admits); 
    fprintf(fid, ' & ');
    fprintf(fid,'%4.3f',hispanic_LA_share); 
    fprintf(fid, ' & ');
    fprintf(fid,'%7.0f',asian_admits); 
    fprintf(fid, ' & ');
    fprintf(fid,'%4.3f',asian_LA_share); 
    fprintf(fid, ' \\\\\n');
end

diary off 

