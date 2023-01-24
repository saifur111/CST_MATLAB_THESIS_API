%Start code here 
addpath(genpath('C:\Users\tuhin\OneDrive\Documents\MATLAB\SaifurCST')); % Your Local Path assign here
cst = actxserver('CSTStudio.application');% Declaration Of cst App
mws = cst.invoke('NewMWS'); % New MSW invoke here

DefaultUnits(mws)% Call The function For Default Units
ComponentList = 'component1'; % Define here cst component
CopperPureLossy(mws) % Call Copper Lossy Material Function 
RogersRT5880lossy(mws) % Call Roger RT5880 Lossy Material Function

%Importsnt Variable Declaration Here
g = 3; % gap of the component variable Declaration
h = 2.5; %height of substrate Variable Declaration
l1 = 22; %width of outer ring Variable Declaration
l2 = 15; %width of inner ring Variable Declaration
ls = 25; %length of substrate Variable Declaration
lw = 1.4; %width of wire Define here
s = 1.5; %width split define here
t = 0.17; %thickness define here 
w = 2; %width of ring define here 

% Create Brick Component
Name = 'Substrate'; % Cst 1st component name
component = 'component1';%Define 1st Component
material = 'Rogers RT5880 (lossy)'; % Define a roger RT5880 Lossy Metamaterial
Xr = [-ls/2 ls/2];
Yr = [-ls/2 ls/2];
Zr = [-h 0];
brick(mws, Name, component, material, Xr, Yr, Zr)
% Create Brick Component
Name = 'Ring1';
component = 'component1';
material = 'Copper (pure)'; %Define a Pure Copper Lossy material
Xr = [-l1/2 l1/2];
Yr = [-l1/2 l1/2];
Zr = [0 t];
brick(mws, Name, component, material, Xr, Yr, Zr)

% Create Brick Component
Name = 'Cut1';
component = 'component1';
material = 'Copper (pure)';
Xr = [-(l1/2)+w (l1/2)-w];
Yr = [-(l1/2)+w (l1/2)-w];
Zr = [0 t];
brick(mws, Name, component, material, Xr, Yr, Zr)

component1 = 'component1:Ring1';
component2 = 'component1:Cut1';
Subtract(mws,component1,component2)% Cut The component

Name = 'Ring1';
id = 12;
PickMidPoint(mws,Name,id)
AlignWCSwithPoint(mws)

Name = 'Cut2';
component = 'component1';
material = 'Copper (pure)';
Xr = [-g/2 g/2];
Yr = [0 w];
Zr = [0 t];
brick(mws, Name, component, material, Xr, Yr, Zr)
component1 = 'component1:Ring1';
component2 = 'component1:Cut2';
Subtract(mws,component1,component2)% Cut The component

SetNormal = [0 0 1];
SetOrigin = [0 0 0];
SetUVector = [1 0 0];
ActivateLocalWCS(mws, SetNormal, SetOrigin, SetUVector, 0)% Active Local WCS

% Create Ring Component
Name = 'Ring2';
component = 'component1';
material = 'Copper (pure)';
Xr = [-(l1/2)+w+s (l1/2)-w-s];
Yr = [-(l1/2)+w+s (l1/2)-w-s];
Zr = [0 t];
brick(mws, Name, component, material, Xr, Yr, Zr)

Name = 'Cut3';
component = 'component1';
material = 'Copper (pure)';
Xr = [-(l1/2)+2*w+s (l1/2)-2*w-s];
Yr = [-(l1/2)+2*w+s (l1/2)-2*w-s];
Zr = [0 t];
brick(mws, Name, component, material, Xr, Yr, Zr)

component1 = 'component1:Ring2';
component2 = 'component1:Cut3';
Subtract(mws,component1,component2)% Cut The component

Name = 'Ring2';
id = 10;
PickMidPoint(mws,Name,id)
AlignWCSwithPoint(mws)

Name = 'Cut4';
component = 'component1';
material = 'Copper (pure)';
Xr = [-g/2 g/2];
Yr = [0 -w];
Zr = [0 t];
brick(mws, Name, component, material, Xr, Yr, Zr)
component1 = 'component1:Ring2';
component2 = 'component1:Cut4';
Subtract(mws,component1,component2)% Cut The component

ActivateLocalWCS(mws, SetNormal, SetOrigin, SetUVector, 0)% Active Local WCS

DefineFrequencyRange(mws,2,10)% Max Min Frequency Range

MeshInitiator(mws)

minfrequency = 2;% Define min Frequency
XminSpace = 0;
XmaxSpace = 0;
YminSpace = 0;
YmaxSpace = 0;
ZminSpace = ls/2;
ZmaxSpace = ls/2;
DefineBackroundMaterial(mws,XminSpace,XmaxSpace, YminSpace, YmaxSpace, ZminSpace, ZmaxSpace)% background Of Material

Xmin = 'electric';
Xmax = 'electric';
Ymin = 'magnetic';
Ymax = 'magnetic';
Zmin = 'open';
Zmax = 'open';

DefineOpenBoundary(mws,minfrequency,Xmin,Xmax,Ymin,Ymax,Zmin,Zmax)% Open Bounndary Function call Here

PortNumber = 1; % Define por 1
Xr1 = [-13 13]; % xmin-max Range
Yr1 = [-13 13];% Ymin-max Range
Zr1 = [0 15];   % Zmin-max Range
Xr1Add = [0 0];
Yr1Add = [0 0];
Zr1Add = [0 0];

WaveguidePort(mws,PortNumber, Xr1, Yr1, Zr1, Xr1Add, Yr1Add, Zr1Add, 'Full','zmax')% Call CstWaveguidePort Function

PortNumber = 2; % Define por 2
Xr2 = [-13 13];
Yr2 = [-13 13];
Zr2 = [-15 0];
Xr2Add = [0 0];
Yr2Add = [0 0];
Zr2Add = [0 0];

WaveguidePort(mws,PortNumber, Xr2, Yr2, Zr2, Xr2Add, Yr2Add, Zr2Add, 'Full','zmin')% Call CstWaveguidePort Function

SaveProject(mws)% Save Cst Project File

DefineTimedomainSolver(mws,-40) % time domain Solver Fiunction Call Here
%End Code Here 
