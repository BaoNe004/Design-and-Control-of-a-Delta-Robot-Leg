clear;
close all;
%% Defining variables & parameters
tic;
syms x y z th1 th2 th3
B_Pp(:,1) = [x; y; z];
B_Pp(:,2) = [x; y; z];
B_Pp(:,3) = [x; y; z];

d = 7.97;
sB = d*(16/2/sqrt(3)+12)*sqrt(3);
sP = d*(9/2);
L = d*9;
l = d*21;
wB = sB*sqrt(3)/6;
uB = sB*sqrt(3)/3;
wP = sP*sqrt(3)/6;
uP = sP*sqrt(3)/3;
%% Vectors
BB(:,1) = [0; -wB; 0];
BB(:,2) = [wB*sqrt(3)/2; wB/2; 0];
BB(:,3) = [-wB*sqrt(3)/2; wB/2; 0];

Bb(:,1) = [sB/2; -wB; 0];
Bb(:,2) = [0; uB; 0];
Bb(:,3) = [-sB/2; -wB; 0];

PP(:,1) = [0; -uP; 0];
PP(:,2) = [sP/2; wP; 0];
PP(:,3) = [-sP/2; wP; 0];

BL(:,1) = [0; -L*cos(th1); -L*sin(th1)];
BL(:,2) = [sqrt(3)/2*L*cos(th2); L/2*cos(th2); -L*sin(th2)];
BL(:,3) = [-sqrt(3)/2*L*cos(th3); L/2*cos(th3); -L*sin(th3)];

Bl = B_Pp + PP - BB - BL;

a = BB+BL;
p = BB+BL+Bl;
%% The Simultaneous Equaations
Blnorm(1,1) = norm(Bl(:,1));
Blnorm(1,2) = norm(Bl(:,2));
Blnorm(1,3) = norm(Bl(:,3));
%% Solving the Forward Kinematics
%{
th0 = [0 pi/6 pi/6];                    % Rotation angle of each motor

Blnorm = subs(Blnorm,[th1 th2 th3],th0);
A = double(subs(a,[th1 th2 th3],th0));
[x0,y0,z0] = vpasolve(Blnorm(1,1)^2==l^2,Blnorm(1,2)^2==l^2,Blnorm(1,3)^2==l^2,...
    [x,y,z],[0,0,-150]);
X = double([x0,y0,z0]);
P = double(subs(p,[th1 th2 th3 x y z],[th0(1) th0(2) th0(3) X(1) X(2) X(3)]));
%}
%% Solving the Inverse Kinematics
phi = linspace(0,2*pi,100);
X(:,1) = 80*cos(phi);
X(:,2) = 80*sin(phi);
X(:,3) = -200*ones(length(phi),1);
A = zeros(3,3,1);
P = zeros(3,3,1);
th = zeros(1,3);   % The theta matrix needed to draw the desired path
% X = [0 -10 -200];
for i = 1:size(X,1)
    Blnorm0 = subs(Blnorm,[x,y,z],X(i,:));
    [th10,th20,th30] = vpasolve(Blnorm0(1,1)^2==l^2,Blnorm0(1,2)^2==l^2,Blnorm0(1,3)^2==l^2,...
        [th1,th2,th3],[0,0,0]);
    th(i,:) = double([th10,th20,th30]);
    A(:,:,i) = double(subs(a,[th1,th2,th3],th(i,:)));
    P(:,:,i) = double(subs(p,[th1 th2 th3 x y z],[th(i,1) th(i,2) th(i,3) X(i,1) X(i,2) X(i,3)]));
end
toc;
%% Plotting the theta data
figure(1)
subplot(3,1,1)
plot(1:length(th),th(:,1),1:length(th),th(:,2),1:length(th),th(:,3))
title('\theta')
subplot(3,1,2)
plot(1:length(th)-1,diff(th(:,1)),1:length(th)-1,diff(th(:,2)),1:length(th)-1,diff(th(:,3)))
title('d\theta/dt')
subplot(3,1,3)
plot(1:length(th)-2,diff(diff(th(:,1))),1:length(th)-2,diff(diff(th(:,2))),1:length(th)-2,diff(diff(th(:,3))))
title('d^2\theta/dt^2')
%legend('\theta_1','\theta_2','\theta_3','location','southoutside','orientation','horizontal')
hold off
%% Plotting the Delta Robot with Circles
figure(2)
hold on

% Plot base as black circle
rectangle('Position',[-wB/2 -wB/2 wB wB]*2,'Curvature',[1,1],'EdgeColor','k');

h1(1) = plot3([BB(1,1) A(1,1,1)],[BB(2,1) A(2,1,1)],[BB(3,1) A(3,1,1)],'k');
h1(2) = plot3([BB(1,2) A(1,2,1)],[BB(2,2) A(2,2,1)],[BB(3,2) A(3,2,1)],'k');
h1(3) = plot3([BB(1,3) A(1,3,1)],[BB(2,3) A(2,3,1)],[BB(3,3) A(3,3,1)],'k');

h2(1) = plot3([A(1,1,1) P(1,1,1)],[A(2,1,1) P(2,1,1)],[A(3,1,1) P(3,1,1)],'k');
h2(2) = plot3([A(1,2,1) P(1,2,1)],[A(2,2,1) P(2,2,1)],[A(3,2,1) P(3,2,1)],'k');
h2(3) = plot3([A(1,3,1) P(1,3,1)],[A(2,3,1) P(2,3,1)],[A(3,3,1) P(3,3,1)],'k');

h3 = plot3([P(1,1,1) P(1,2,1) P(1,3,1) P(1,1,1)],...
    [P(2,1,1) P(2,2,1) P(2,3,1) P(2,1,1)],...
    [P(3,1,1) P(3,2,1) P(3,3,1) P(3,1,1)],'k');
h4 = plot3(X(1,1),X(1,2),X(1,3),'kx');

% Initialize a red point plot handle
h5 = plot3(X(1,1), X(1,2), X(1,3), 'ro', 'MarkerFaceColor', 'r');

axis equal
axis([-sB sB -sB sB -(l+L) (l+L)/2])
grid on
view(3);

title('Delta Robot Analysis with Circles and Red Point')


%% Animation
%{
%video
filename=('DeltaRobotTest');
writerObj=VideoWriter(filename);
writerObj.FrameRate=30;
open(writerObj);
%}
for i = 1:size(X,1)
    set(h1(1),'xdata',[BB(1,1) A(1,1,i)],'ydata',[BB(2,1) A(2,1,i)],'zdata',[BB(3,1) A(3,1,i)]);
    set(h1(2),'xdata',[BB(1,2) A(1,2,i)],'ydata',[BB(2,2) A(2,2,i)],'zdata',[BB(3,2) A(3,2,i)]);
    set(h1(3),'xdata',[BB(1,3) A(1,3,i)],'ydata',[BB(2,3) A(2,3,i)],'zdata',[BB(3,3) A(3,3,i)]);
    
    set(h2(1),'xdata',[A(1,1,i) P(1,1,i)],'ydata',[A(2,1,i) P(2,1,i)],'zdata',[A(3,1,i) P(3,1,i)]);
    set(h2(2),'xdata',[A(1,2,i) P(1,2,i)],'ydata',[A(2,2,i) P(2,2,i)],'zdata',[A(3,2,i) P(3,2,i)]);
    set(h2(3),'xdata',[A(1,3,i) P(1,3,i)],'ydata',[A(2,3,i) P(2,3,i)],'zdata',[A(3,3,i) P(3,3,i)]);
    
    set(h3,'xdata',[P(1,1,i) P(1,2,i) P(1,3,i) P(1,1,i)],...
        'ydata',[P(2,1,i) P(2,2,i) P(2,3,i) P(2,1,i)],...
        'zdata',[P(3,1,i) P(3,2,i) P(3,3,i) P(3,1,i)]);
    
    set(h4,'xdata',X(i,1),'ydata',X(i,2),'zdata',X(i,3));
    
    % Update the red point to follow the end effector's position
    set(h5, 'xdata', X(i,1), 'ydata', X(i,2), 'zdata', X(i,3));
    
    plot3(X(i,1),X(i,2),X(i,3),'k.','markersize',1)
    drawnow
    %{
    %video
    videoframe=getframe(gcf);
    writeVideo(writerObj,videoframe);
    %}
end
%{
%video
close(writerObj);
fprintf('video finished\n');
%}
