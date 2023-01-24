function DefineTimedomainSolver(mws,SteadyStateLimit)

%'@ define time domain solver parameters
% SteadyStateLimit is usualy -30 or -40 db
Mesh = invoke(mws,'Mesh');
invoke(Mesh,'SetCreator','High Frequency');

Solver = invoke(mws,'Solver');
invoke(Solver,'Method','Hexahedral');
invoke(Solver,'CalculationType','TD-S');
invoke(Solver,'StimulationPort','All');
invoke(Solver,'StimulationMode','All');
invoke(Solver,'SteadyStateLimit',int2str(SteadyStateLimit));
invoke(Solver,'MeshAdaption','False');
invoke(Solver,'AutoNormImpedance','False');
invoke(Solver,'NormingImpedance','50');
invoke(Solver,'CalculateModesOnly','False');
invoke(Solver,'SParaSymmetry','False');
invoke(Solver,'StoreTDResultsInCache','False');
invoke(Solver,'FullDeembedding','False');
invoke(Solver,'SuperimposePLWExcitation','False');
invoke(Solver,'UseSensitivityAnalysis','False');
invoke(Solver,'Start'); %initializes simulation

end



