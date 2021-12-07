clear
clc
delete('Logs/divergent_counterfactuals_normal.diary');
diary('Logs/divergent_counterfactuals_normal.diary');
diary on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup variables to capture status quo in 2015-2017
% Values below are based on calculations from SFFA v. Harvard Trial Exhibit DX 042.  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global w_l_app w_nl_app b_l_app b_nl_app h_l_app h_nl_app a_l_app a_nl_app u_l_app u_nl_app o_l_app o_nl_app
global w_l_index w_nl_index b_l_index b_nl_index h_l_index h_nl_index a_l_index a_nl_index u_l_index u_nl_index o_l_index o_nl_index

w_l_app=2243;
w_l_adm=946;
w_nl_app=32940;
w_nl_adm=1641;

b_l_app=213;
b_l_adm=91;
b_nl_app=10193;
b_nl_adm=604;

h_l_app=170;
h_l_adm=74;
h_nl_app=10421;
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

w_l_index=norminv((w_l_adm/w_l_app));
w_nl_index=norminv((w_nl_adm/w_nl_app));

b_l_index=norminv((b_l_adm/b_l_app));
b_nl_index=norminv((b_nl_adm/b_nl_app));

h_l_index=norminv((h_l_adm/h_l_app));
h_nl_index=norminv((h_nl_adm/h_nl_app));

a_l_index=norminv((a_l_adm/a_l_app));
a_nl_index=norminv((a_nl_adm/a_nl_app));

u_l_index=norminv((u_l_adm/u_l_app));
u_nl_index=norminv((u_nl_adm/u_nl_app));

o_l_index=norminv((o_l_adm/o_l_app));
o_nl_index=norminv((o_nl_adm/o_nl_app));

b = zeros(2,1);
disp('******Status Quo******')
w_l_adm=normcdf(w_l_index+b(1)+b(2))*w_l_app;
w_nl_adm=normcdf(w_nl_index+b(1))*w_nl_app;
white_admits=round(w_l_adm+w_nl_adm)
white_LA_share=w_l_adm/(w_l_adm+w_nl_adm)

b_l_adm=normcdf(b_l_index+b(1)+b(2))*b_l_app;
b_nl_adm=normcdf(b_nl_index+b(1))*b_nl_app;
black_admits=round(b_l_adm+b_nl_adm)
black_LA_share=b_l_adm/(b_l_adm+b_nl_adm)

h_l_adm=normcdf(h_l_index+b(1)+b(2))*h_l_app;
h_nl_adm=normcdf(h_nl_index+b(1))*h_nl_app;
hispanic_admits=round(h_l_adm+h_nl_adm)
hispanic_LA_share=h_l_adm/(h_l_adm+h_nl_adm)

a_l_adm=normcdf(a_l_index+b(1)+b(2))*a_l_app;
a_nl_adm=normcdf(a_nl_index+b(1))*a_nl_app;
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
b_nl_app=10263;  % 10193+(213-143)

h_l_app=64;    %this means 2.2% are Hispanic
h_nl_app=10527;  % 10421+(170-64)

a_l_app=134;   %this means 4.6% are Asian
a_nl_app=21777;   % 21591+(320-134)

% Find the new legacy bonus and intercept to maintain the legacy admit rate
% advantaage and capacity constraint
b=fminsearch('counter1norm',0.0,options)
feval('counter1norm',b)

% Using the admissions adjustments, calculate admits and shares
disp('******Counterfactual 1******')
w_l_adm=normcdf(w_l_index+b(1))*w_l_app;
w_nl_adm=normcdf(w_nl_index+b(1))*w_nl_app;
white_admits=round(w_l_adm+w_nl_adm)
white_LA_share=w_l_adm/(w_l_adm+w_nl_adm)

b_l_adm=normcdf(b_l_index+b(1))*b_l_app;
b_nl_adm=normcdf(b_nl_index+b(1))*b_nl_app;
black_admits=round(b_l_adm+b_nl_adm)
black_LA_share=b_l_adm/(b_l_adm+b_nl_adm)

h_l_adm=normcdf(h_l_index+b(1))*h_l_app;
h_nl_adm=normcdf(h_nl_index+b(1))*h_nl_app;
hispanic_admits=round(h_l_adm+h_nl_adm)
hispanic_LA_share=h_l_adm/(h_l_adm+h_nl_adm)

a_l_adm=normcdf(a_l_index+b(1))*a_l_app;
a_nl_adm=normcdf(a_nl_index+b(1))*a_nl_app;
asian_admits=round(a_l_adm+a_nl_adm)
asian_LA_share=a_l_adm/(a_l_adm+a_nl_adm)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Counterfactual 2 - Return LA preferences back to 2000
% Alter the legacy advantage so that admit rate ratio is 4.15.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% reset the URM application numbers back to their 2015 values
b_l_app=213;
b_nl_app=10193;
h_l_app=170;
h_nl_app=10421;
a_l_app=320;
a_nl_app=21591;

b=fminsearch('counter2norm',[0.0;0.0],options)
feval('counter2norm',b)

% Using the admissions adjustments, calculate admits and shares
disp('******Counterfactual 2******')
w_l_adm=normcdf(w_l_index+b(1)+b(2))*w_l_app;
w_nl_adm=normcdf(w_nl_index+b(1))*w_nl_app;
white_admits=round(w_l_adm+w_nl_adm)
white_LA_share=w_l_adm/(w_l_adm+w_nl_adm)

b_l_adm=normcdf(b_l_index+b(1)+b(2))*b_l_app;
b_nl_adm=normcdf(b_nl_index+b(1))*b_nl_app;
black_admits=round(b_l_adm+b_nl_adm)
black_LA_share=b_l_adm/(b_l_adm+b_nl_adm)

h_l_adm=normcdf(h_l_index+b(1)+b(2))*h_l_app;
h_nl_adm=normcdf(h_nl_index+b(1))*h_nl_app;
hispanic_admits=round(h_l_adm+h_nl_adm)
hispanic_LA_share=h_l_adm/(h_l_adm+h_nl_adm)

a_l_adm=normcdf(a_l_index+b(1)+b(2))*a_l_app;
a_nl_adm=normcdf(a_nl_index+b(1))*a_nl_app;
asian_admits=round(a_l_adm+a_nl_adm)
asian_LA_share=a_l_adm/(a_l_adm+a_nl_adm)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Counterfactual 3 - Return LA preferences back to 2000 and the share or
% URM that are legacy
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
b_l_app=143;   %this means 4.9% are African American 
b_nl_app=10263;  % 10193+(213-143)

h_l_app=64;    %this means 2.2% are Hispanic
h_nl_app=10527;  % 10421+(170-64)

a_l_app=134;   %this means 4.6% are Asian
a_nl_app=21777;   % 21591+(320-134)


b=fminsearch('counter3norm',[0.0;0.0],options)
feval('counter3norm',b)

% Using the admissions adjustments, calculate admits and shares
disp('******Counterfactual 3******')
w_l_adm=normcdf(w_l_index+b(1)+b(2))*w_l_app;
w_nl_adm=normcdf(w_nl_index+b(1))*w_nl_app;
white_admits=round(w_l_adm+w_nl_adm)
white_LA_share=w_l_adm/(w_l_adm+w_nl_adm)

b_l_adm=normcdf(b_l_index+b(1)+b(2))*b_l_app;
b_nl_adm=normcdf(b_nl_index+b(1))*b_nl_app;
black_admits=round(b_l_adm+b_nl_adm)
black_LA_share=b_l_adm/(b_l_adm+b_nl_adm)

h_l_adm=normcdf(h_l_index+b(1)+b(2))*h_l_app;
h_nl_adm=normcdf(h_nl_index+b(1))*h_nl_app;
hispanic_admits=round(h_l_adm+h_nl_adm)
hispanic_LA_share=h_l_adm/(h_l_adm+h_nl_adm)

a_l_adm=normcdf(a_l_index+b(1)+b(2))*a_l_app;
a_nl_adm=normcdf(a_nl_index+b(1))*a_nl_app;
asian_admits=round(a_l_adm+a_nl_adm)
asian_LA_share=a_l_adm/(a_l_adm+a_nl_adm)

diary off 
