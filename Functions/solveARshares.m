function [newShares,DeltaHat,kappa,avg] = solveARshares(ARtarget,Data)
    %SOLVEARSHARES This function computes academic rating shares for ALDC
    %applicants when the ALDC admission rate advantage is ARratio
    %   See appendix of the paper for mathematical details

    % first, get ordered logit cut points associated with obs shares (pi's)
    kappa = zeros(4,1);

    kappa(1) = -log(1/(Data.Share(Data.AcademicRating=='1'))-1);
    kappa(2) = -log(1/(Data.Share(Data.AcademicRating=='2')+1/(1+exp(-kappa(1))))-1);
    kappa(3) = -log(1/(Data.Share(Data.AcademicRating=='3')+1/(1+exp(-kappa(2))))-1);
    kappa(4) = -log(1/(Data.Share(Data.AcademicRating=='4')+1/(1+exp(-kappa(3))))-1);

    % now, estimate the parameter Delta that shifts leftward the ALDC academic
    % distribution to bring the admit rate in line with ARtarget
    % Start at Delta=1
    options  = optimset('TolFun',1e-20,'TolX',1e-20);
    DeltaHat = fminunc('minDelta',1,options,kappa,ARtarget,Data);

    % return academic index distribution corresponding to DeltaHat
    newShares = zeros(5,1);
    newShares(1) = 1/(1+exp(DeltaHat-kappa(1)));
    newShares(2) = 1/(1+exp(DeltaHat-kappa(2)))-1/(1+exp(DeltaHat-kappa(1)));
    newShares(3) = 1/(1+exp(DeltaHat-kappa(3)))-1/(1+exp(DeltaHat-kappa(2)));
    newShares(4) = 1/(1+exp(DeltaHat-kappa(4)))-1/(1+exp(DeltaHat-kappa(3)));
    newShares(5) = 1-1/(1+exp(DeltaHat-kappa(4)));
    
    avg = newShares'*[1:5]';
end