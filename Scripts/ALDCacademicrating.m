% compute academic rating distribution of ALDC's under a scenario where
% their admissions advantage did not grow over time

load Data/academicRatings
load Data/overallAdmRates

AllAR = academicRatings(academicRatings.Race=='All',:);
WA_AR = academicRatings(academicRatings.Race~='All',:);

AllCutAR = academicRatings(academicRatings.Race=='All',:);
WA_CutAR = academicRatings(academicRatings.Race~='All',:);
AllCutAR.AdmitRate(AllCutAR.Group=='ALDC') = AllCutAR.AdmitRate(AllCutAR.Group=='ALDC')./2;
WA_CutAR.AdmitRate(WA_CutAR.Group=='ALDC') = WA_CutAR.AdmitRate(WA_CutAR.Group=='ALDC')./2;

% what is the existing admit rate ratio between ALDCs ("LA"s) and typicals?
AR_ratio_all = AllAR.AdmitRate(AllAR.AcademicRating=='Total' & AllAR.Group=='ALDC')./AllAR.AdmitRate(AllAR.AcademicRating=='Total' & AllAR.Group=='Typical');
AR_ratio_WA  = WA_AR.AdmitRate(WA_AR.AcademicRating=='Total' & WA_AR.Group=='ALDC')./WA_AR.AdmitRate(WA_AR.AcademicRating=='Total' & WA_AR.Group=='Typical');

% what is the new admit rate for ALDCs ("LA"s) under a preference level that is half of the existing one?
AR_ALDC_target_all = AllAR.AdmitRate(AllAR.AcademicRating=='Total' & AllAR.Group=='ALDC')./2;
AR_ALDC_target_WA  = WA_AR.AdmitRate(WA_AR.AcademicRating=='Total' & WA_AR.Group=='ALDC')./2;

% suppose that athlete admit rates must not go below 50%. What would the ALDC ("LA") admit rate have to be in this case, using the
% "half-of-the-existing-advantage" admit rate from above?
N_LDC_all = AllAR.Applicants(AllAR.AcademicRating=='Total' & AllAR.Group=='LDC');
N_LDC_WA  = WA_AR.Applicants(WA_AR.AcademicRating=='Total' & WA_AR.Group=='LDC');
N_A_all = AllAR.Applicants(AllAR.AcademicRating=='Total' & AllAR.Group=='Athlete');
N_A_WA  = WA_AR.Applicants(WA_AR.AcademicRating=='Total' & WA_AR.Group=='Athlete');
AR_A50LDC_target_all = (AR_ALDC_target_all*(N_A_all+N_LDC_all) - 0.5*N_A_all)/N_LDC_all;
AR_A50LDC_target_WA  = (AR_ALDC_target_WA *(N_A_WA +N_LDC_WA ) - 0.5*N_A_WA )/N_LDC_WA;


% solve for counterfactual shares for all-races group when ALDC admit rate is half of what it was
[newShrAll,DeltaHatAll,kappaAll,avgAll] = solveARshares(AR_ALDC_target_all,AllAR(AllAR.Group=='ALDC',:));


% solve for counterfactual shares for white and Asian American group when ALDC admit rate is half of what it was
[newShrWA,DeltaHatWA,kappaWA,avgWA] = solveARshares(AR_ALDC_target_WA,WA_AR(WA_AR.Group=='ALDC',:));


% solve for counterfactual shares for all-races group when athletes have a 50% admit rate
[newShrAll50,DeltaHatAll50,kappaAll50,avgAll50] = solveARshares(AR_A50LDC_target_all,AllAR(AllAR.Group=='LDC',:));


% solve for counterfactual shares for white and Asian American group when athletes have a 50% admit rate
[newShrWA50,DeltaHatWA50,kappaWA50,avgWA50] = solveARshares(AR_A50LDC_target_WA,WA_AR(WA_AR.Group=='LDC',:));


% compare answers
disp('actual LA academic rating shares and counterfactual LA academic rating shares if admissions advantage had stayed constant')
disp('all races')
[AllAR.Share(AllAR.Group=='ALDC' & AllAR.AcademicRating~='Total') newShrAll newShrAll50]
disp('whites and asian americans')
[WA_AR.Share(WA_AR.Group=='ALDC' & WA_AR.AcademicRating~='Total') newShrWA  newShrWA50]
disp('actual LA average academic rating and counterfactual LA average academic rating if admissions advantage had stayed constant')
disp('all races')
[AllAR.Share(AllAR.Group=='ALDC' & AllAR.AcademicRating~='Total')'*[1:5]' avgAll avgAll50]
disp('whites and asian americans')
[WA_AR.Share(WA_AR.Group=='ALDC' & WA_AR.AcademicRating~='Total')'*[1:5]' avgWA  avgWA50]

