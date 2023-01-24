%Start
addpath(genpath('C:\Users\tuhin\OneDrive\Documents\MATLAB\SaifurCST')); % Your Local api Path
cst = actxserver('CSTStudio.application');
mws = cst.invoke('NewMWS');

DefaultUnits(mws)
ComponentList = 'component1';
CopperPureLossy(mws)
RogersRT5880lossy(mws)

g = 3; %gap
h = 2.5; %substrate height
l1 = 22; %outer ring width
l2 = 15; %inner ring width
ls = 25; %substrate length
lw = 1.4; %wire width
s = 1.5; %split width
t = 0.17; %thickness
w = 2; %ring width

Name = 'Substrate';
component = 'component1';
material = 'Rogers RT5880 (lossy)';
Xr = [-ls/2 ls/2];
Yr = [-ls/2 ls/2];
Zr = [-h 0];

brick(mws, Name, component, material, Xr, Yr, Zr)

Name = 'Ring1';
component = 'component1';
material = 'Copper (pure)';
Xr = [-l1/2 l1/2];
Yr = [-l1/2 l1/2];
Zr = [0 t];

brick(mws, Name, component, material, Xr, Yr, Zr)
Name = 'Cut1';
component = 'component1';
material = 'Copper (pure)';
Xr = [-(l1/2)+w (l1/2)-w];
Yr = [-(l1/2)+w (l1/2)-w];
Zr = [0 t];

brick(mws, Name, component, material, Xr, Yr, Zr)
component1 = 'component1:Ring1';
component2 = 'component1:Cut1';
Subtract(mws,component1,component2)
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
Subtract(mws,component1,component2)
SetNormal = [0 0 1];
SetOrigin = [0 0 0];
SetUVector = [1 0 0];

ActivateLocalWCS(mws, SetNormal, SetOrigin, SetUVector, 0)
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
Subtract(mws,component1,component2)
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
Subtract(mws,component1,component2)

ActivateLocalWCS(mws, SetNormal, SetOrigin, SetUVector, 0)

DefineFrequencyRange(mws,2,10)

MeshInitiator(mws)

minfrequency = 2;
XminSpace = 0;
XmaxSpace = 0;
YminSpace = 0;
YmaxSpace = 0;
ZminSpace = ls/2;
ZmaxSpace = ls/2;

DefineBackroundMaterial(mws,XminSpace,XmaxSpace, YminSpace, YmaxSpace, ZminSpace, ZmaxSpace)

Xmin = 'electric';
Xmax = 'electric';
Ymin = 'magnetic';
Ymax = 'magnetic';
Zmin = 'open';
Zmax = 'open';

DefineOpenBoundary(mws,minfrequency,Xmin,Xmax,Ymin,Ymax,Zmin,Zmax)

PortNumber = 1;
Xr1 = [-13 13];
Yr1 = [-13 13];
Zr1 = [0 15];
Xr1Add = [0 0];
Yr1Add = [0 0];
Zr1Add = [0 0];

WaveguidePort(mws,PortNumber, Xr1, Yr1, Zr1, Xr1Add, Yr1Add, Zr1Add, 'Full','zmax')

PortNumber = 2;
Xr2 = [-13 13];
Yr2 = [-13 13];
Zr2 = [-15 0];
Xr2Add = [0 0];
Yr2Add = [0 0];
Zr2Add = [0 0];

WaveguidePort(mws,PortNumber, Xr2, Yr2, Zr2, Xr2Add, Yr2Add, Zr2Add, 'Full','zmin')

SaveProject(mws)

DefineTimedomainSolver(mws,-40)
%End
