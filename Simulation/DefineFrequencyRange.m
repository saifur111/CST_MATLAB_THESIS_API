function DefineFrequencyRange(mws,frange1,frange2)


%'@ define frequency range

Solver = invoke(mws,'Solver');

invoke(Solver,'FrequencyRange',num2str(frange1),num2str(frange2));
MeshSettings = invoke(mws,'MeshSettings');
invoke(MeshSettings, 'SetMeshType','Hex');
invoke(MeshSettings, 'Set','Version','1%');
Mesh = invoke(mws,'Mesh');    
invoke(Mesh, 'MeshType','PBA');


end



