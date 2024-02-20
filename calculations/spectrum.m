% Non-equilibrium Transitions in Sub/Second Harmonic Generation: Quantum Theory

% Sub harmonic generation 
w = linspace(-5,5,1000);

% Condition 1: epsilon_2 == 0.46
a1 = 0;
a2 = 0.2;
r1 = 0.5;
R = (a1^2 + r1 - w.^2).^2 - w.^2*(r1+1)^2 - a2^2.*(1-w.^2);
J = 2.*w.*(a2^2-(r1+1).*(a1^2+r1-w.^2));
S12c2 = (a2^2.*(w.^2 + 1).*(a1^2 + r1.*(w.^2 + 1)))./(2*pi*(R.^2 +J.^2));

% Condition 2: epsilon_2 == 0.2
a1 = 0;
a2 = 0.46;
r1 = 0.5;
R = (a1^2 + r1 - w.^2).^2 - w.^2*(r1+1)^2 - a2^2.*(1-w.^2);
J = 2.*w.*(a2^2-(r1+1).*(a1^2+r1-w.^2));
S12c1 = (a2^2.*(w.^2 + 1).*(a1^2 + r1.*(w.^2 + 1)))./(140*pi*(R.^2 +J.^2));

% Condition 3: epsilon_2 == 5
a2 = 0.5;
r1 = 0.5;
a1 = sqrt(2*(5-0.5));
R = (a1^2 + r1 - w.^2).^2 - w.^2*(r1+1)^2 - a2^2.*(1-w.^2);
J = 2.*w.*(a2^2-(r1+1).*(a1^2+r1-w.^2));
S12c3 = (a2^2.*(w.^2 + 1).*(a1^2 + r1.*(w.^2 + 1)))./(pi*(R.^2 +J.^2));

% Second harmonic generation 
w = linspace(-2,2,1000);
syms x1 x2 x3

% Condition 1: epsilon_1 == 0.30
s1 = vpa(solve(-2*x1^3 + 4*0.58*x1^2 - 2*0.5^2*x1 == 0.3^2,x1));
a2 = s1(1);
a1 = sqrt(-2*a2);
r1 = 0.5;
R = (a1^2 + r1 - w.^2).^2 - w.^2*(r1+1)^2 - a2^2.*(1-w.^2);
J = 2.*w.*(a2^2-(r1+1).*(a1^2+r1-w.^2));
S34c1 = (a2^2.*a1^2.*(a1^2 + r1.*(w.^2 + 1)))./(pi*(R.^2 +J.^2));

% Condition 2: epsilon_1 == 1
s2 = vpa(solve(-2*x1^3 + 4*0.58*x1^2 - 2*0.5^2*x1 == 1^2,x1));
a2 = s2(1);
a1 = sqrt(-2*a2);
r1 = 0.5;
R = (a1^2 + r1 - w.^2).^2 - w.^2*(r1+1)^2 - a2^2.*(1-w.^2);
J = 2.*w.*(a2^2-(r1+1).*(a1^2+r1-w.^2));
S34c2 = (a2^2.*a1^2.*(a1^2 + r1.*(w.^2 + 1)))./(15*pi*(R.^2 +J.^2));

% Condition 3: epsilon_1 == 1
s3 = vpa(solve(-2*x1^3 + 4*0.58*x1^2 - 2*0.5^2*x1 == 3.4^2,x1));
a2 = s3(1);
a1 = sqrt(-2*a2);
r1 = 0.5;
R = (a1^2 + r1 - w.^2).^2 - w.^2*(r1+1)^2 - a2^2.*(1-w.^2);
J = 2.*w.*(a2^2-(r1+1).*(a1^2+r1-w.^2));
S34c3 = (a2^2.*a1^2.*(a1^2 + r1.*(w.^2 + 1)))./(5000*pi*(R.^2 +J.^2));

% Plot figures
figure(1)
plot(w,S12c1,w,S12c2,w,S12c3,'LineWidth', 2)
set(gca,'fontsize',16)
xlabel('\omega/\gamma_2')
ylabel('S_{12}(\omega)')
legend('\kappa\epsilon_2/\gamma_2^2=0.20','\kappa\epsilon_2/\gamma_2^2=0.46','\kappa\epsilon_2/\gamma_2^2=5.00')
grid
figure(2)
plot(w,S34c1,w,S34c2,w,S34c3,'LineWidth', 2)
set(gca,'fontsize',16)
xlabel('\omega/\gamma_2')
ylabel('S_{34}(\omega)')
legend('\kappa\epsilon_1/\gamma_2^2=0.30','\kappa\epsilon_1/\gamma_2^2=1.00','\kappa\epsilon_1/\gamma_2^2=3.40')
grid

