%% Simulate a Delta Robot mechanism
% copyright by Sebastian
% ETHZ

%% init
clc;
clear all;

%% Parameters
%rod length in m:
r_f=5e-2; %Base to Joint
r_e=8e-2; %Joint to endeffector

%triangular side length in m:
f=8e-2; %base
e=6e-2; %endeffector

%endeffector z
syms z real

param=[r_f,r_e,f,e,z];

%% kinematics
%actuator angles:
m=10; %number of trajectory points
n=3; %number of Poses
r0=[0,0,-0.1]; %start Pose
rGoal=zeros(n+1,3);
rGoal(1,:)=r0';
rGoal(2,:)=[-0.01,-0.03,-0.12];
rGoal(3,:)=[-0.01,0.025,-0.06];
rGoal(4,:)=[-0.05,0,-0.1];

trajectory=zeros(3,m,n);
angles=zeros(3,m,n);
for i=1:n
    trajectory(:,:,i)=CalcTrajectory(rGoal(i,:),rGoal(i+1,:),m);
    angles(:,:,i)=CalcTrajectoryAngles(trajectory(:,:,i),param)*pi/180;
end

%% Plot
for i=1:n
    Animation(angles(:,:,i),trajectory(:,:,i),param);
end





















