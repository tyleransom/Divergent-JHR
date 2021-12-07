clear; clc;
load Data/applications_IPEDS_Ivy

HarvardApps=applicants(23:44,:);
THarvardApps=Tapplicants(23:40,:);
OtherApps=applicants(1:22,:);
OtherApps=round(OtherApps);

A=NaN(5,1);
OtherApps(1:5)=A;
HarvardApps(1:5)=A;
THarvardApps(19:22)=A(1:4);
year=year1(1:22,:);
clear Harvard applicants Tapplicants year1
Hfinal = [THarvardApps(1:18);HarvardApps(19:22)];

% Create levels figure (Figure B4, panel a)
applicationslevelsfig1Ivy(year,[Hfinal OtherApps]);

% Growth relative to class of 2005
HarvardAppsGrowth=(HarvardApps-HarvardApps(6))./HarvardApps(6);
OtherAppsGrowth=(OtherApps-OtherApps(6))./OtherApps(6);
THarvardAppsGrowth=(THarvardApps-THarvardApps(6))./THarvardApps(6);
HfinalGrowth=(Hfinal-Hfinal(6))./Hfinal(6);

% Create growth figure (Figure B4, panel b)
applicationsgrowthfig1Ivy(year,[HfinalGrowth OtherAppsGrowth]);

