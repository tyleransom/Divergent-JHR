function err = minDelta(Dlta,kap,ARtgt,Dat)
    pistar = zeros(5,1);
    pistar(1) = 1/(1+exp(Dlta-kap(1)));
    pistar(2) = 1/(1+exp(Dlta-kap(2)))-1/(1+exp(Dlta-kap(1)));
    pistar(3) = 1/(1+exp(Dlta-kap(3)))-1/(1+exp(Dlta-kap(2)));
    pistar(4) = 1/(1+exp(Dlta-kap(4)))-1/(1+exp(Dlta-kap(3)));
    pistar(5) = 1-1/(1+exp(Dlta-kap(4)));

    Napp   = Dat.Applicants(Dat.AcademicRating=='Total');
    ARact  = Dat.AdmitRate(Dat.AcademicRating~='Total');
    newApp = zeros(5,1);
    newAdm = zeros(5,1);
    for i=1:5
        newApp(i) = pistar(i)*Napp;
        newAdm(i) = newApp(i)*ARact(i);
    end
    ARtmp = sum(newAdm)/sum(newApp);
    err = (ARtmp - ARtgt)^2;
end