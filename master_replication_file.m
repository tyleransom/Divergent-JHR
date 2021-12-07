addpath 'Functions' 'Scripts'

%-------------------
% Figures
%-------------------

% create Figure 1, Figure 2, Figure 3
harvardaggv2

% create Figure 4
harvardSAT

% create Figure 5 (Figure 2 but for whites, Asians and missing race only)
harvardaggWAM 

% create Figure 6 and Figure B1
harvardBYrace 

% create Appendix Figures B3 and B4
applications_comparison_IPEDS % Figure B3
applications_comparison_IPEDS_Ivy % Figure B4


%-------------------
% Tables
%-------------------
% create Table 3 (results printed in console)
divergent_counterfactuals

% ROBUSTNESS: Table 3 (assuming Normally distributed [as opposed to logit distributed] preference shocks)
divergent_counterfactuals_normal

% ROBUSTNESS: Table 3 (allowing LA/NLNA admit rate ratio to vary)
divergent_counterfactuals_diffratio

% ROBUSTNESS: Table 3 (removing non-competitive applicants)
divergent_counterfactuals_no_RtoR

% create Table 4
divergent_counterfactuals_no_RtoR_diffratio

% create Table C1 (results about changing LA strength)
ALDCacademicrating