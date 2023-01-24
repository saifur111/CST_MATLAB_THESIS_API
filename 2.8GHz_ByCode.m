%Start
addpath(genpath('C:\Users\tuhin\OneDrive\Documents\MATLAB\SaifurCST')); % Your Local api Path
cst = actxserver('CSTStudio.application');
mws = cst.invoke('NewMWS');

CstDefaultUnits(mws)
ComponentList = 'component1';
CstCopperPureLossy(mws)
CstRogersRT5880lossy(mws)
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
Xrange = [-ls/2 ls/2];
Yrange = [-ls/2 ls/2];
Zrange = [-h 0];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange)
Name = 'Ring1';
component = 'component1';
material = 'Copper (pure)';
Xrange = [-l1/2 l1/2];
Yrange = [-l1/2 l1/2];
Zrange = [0 t];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange)
Name = 'Cut1';
component = 'component1';
material = 'Copper (pure)';
Xrange = [-(l1/2)+w (l1/2)-w];
Yrange = [-(l1/2)+w (l1/2)-w];
Zrange = [0 t];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange)
component1 = 'component1:Ring1';
component2 = 'component1:Cut1';
CstSubtract(mws,component1,component2)
Name = 'Ring1';
id = 12;
CstPickMidPoint(mws,Name,id)
CstAlignWCSwithPoint(mws)
Name = 'Cut2';
component = 'component1';
material = 'Copper (pure)';
Xrange = [-g/2 g/2];
Yrange = [0 w];
Zrange = [0 t];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange)
component1 = 'component1:Ring1';
component2 = 'component1:Cut2';
CstSubtract(mws,component1,component2)
SetNormal = [0 0 1];
SetOrigin = [0 0 0];
SetUVector = [1 0 0];
CstActivateLocalWCS(mws, SetNormal, SetOrigin, SetUVector, 0)
Name = 'Ring2';
component = 'component1';
material = 'Copper (pure)';
Xrange = [-(l1/2)+w+s (l1/2)-w-s];
Yrange = [-(l1/2)+w+s (l1/2)-w-s];
Zrange = [0 t];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange)
Name = 'Cut3';
component = 'component1';
material = 'Copper (pure)';
Xrange = [-(l1/2)+2*w+s (l1/2)-2*w-s];
Yrange = [-(l1/2)+2*w+s (l1/2)-2*w-s];
Zrange = [0 t];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange)
component1 = 'component1:Ring2';
component2 = 'component1:Cut3';
CstSubtract(mws,component1,component2)
Name = 'Ring2';
id = 10;
CstPickMidPoint(mws,Name,id)
CstAlignWCSwithPoint(mws)
Name = 'Cut4';
component = 'component1';
material = 'Copper (pure)';
Xrange = [-g/2 g/2];
Yrange = [0 -w];
Zrange = [0 t];
Cstbrick(mws, Name, component, material, Xrange, Yrange, Zrange)
component1 = 'component1:Ring2';
component2 = 'component1:Cut4';
CstSubtract(mws,component1,component2)
CstActivateLocalWCS(mws, SetNormal, SetOrigin, SetUVector, 0)
CstActivateLocalWCS(mws, SetNormal, SetOrigin, SetUVector, 0)
CstDefineFrequencyRange(mws,2,10)
CstMeshInitiator(mws)
minfrequency = 2;
XminSpace = 0;
XmaxSpace = 0;
YminSpace = 0;
YmaxSpace = 0;
ZminSpace = ls/2;
ZmaxSpace = ls/2;
CstDefineBackroundMaterial(mws,XminSpace,XmaxSpace, YminSpace, YmaxSpace, ZminSpace, ZmaxSpace)
Xmin = 'electric';
Xmax = 'electric';
Ymin = 'magnetic';
Ymax = 'magnetic';
Zmin = 'open';
Zmax = 'open';
CstDefineOpenBoundary(mws,minfrequency,Xmin,Xmax,Ymin,Ymax,Zmin,Zmax)
PortNumber = 1;
Xrange = [-13 13];
Yrange = [-13 13];
Zrange = [0 15]; % go port 1 . Give Zpos = 15 then start simulation again
XrangeAdd = [0 0];
YrangeAdd = [0 0];
ZrangeAdd = [0 0];
CstWaveguidePort(mws,PortNumber, Xrange, Yrange, Zrange, XrangeAdd, YrangeAdd, ZrangeAdd, 'Full','zmax')
PortNumber = 2;
Xrange = [-13 13];
Yrange = [-13 13];
Zrange = [-15 0];
XrangeAdd = [0 0];
YrangeAdd = [0 0];
ZrangeAdd = [0 0];
CstWaveguidePort(mws,PortNumber, Xrange, Yrange, Zrange, XrangeAdd, YrangeAdd, ZrangeAdd, 'Full','zmin')
CstSaveProject(mws)
CstDefineTimedomainSolver(mws,-40)
%End
