function [polynomial] = GeneratePolynomialLab5(thetaStart,thetaEnd)
%GENERATEPOLYNOMIALLAB5 takes theta start and end, plugs them into the
%polynomial matrix
% The eqation is a simplified version of [timederivatives of theta] * [polynomial] = theta 
%this func inverts [timederivatives of theta] and multipies it by theta to
%get the polynomial
t=5;
timeDeriv = [1 0 0 0 0 0;
    0 1 0 0 0 0;
    0 0 1 0 0 0;
    1 t t^2 t^3 t^4 t^5;
    0 0 2*t 3*t^2 4*t^3 5*t^4;
    0 0 0 6*t 12*t^2 20*t^3];
thetaStartEnd = [thetaStart;0;0;thetaEnd;0;0];

polynomialUnRev = inv(timeDeriv) * thetaStartEnd;
polynomial = flip(polynomialUnRev,1);

%Why does Matlab evaluate polynomials backwards? ^


end

