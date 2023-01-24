
function MeshInitiator(mws)

%' switch on FD-TET setting for accurate farfields


FDSolver = invoke(mws,'FDSolver');
invoke(FDSolver,'ExtrudeOpenBC','True');

Mesh = invoke(mws,'Mesh');
invoke(Mesh,'FPBAAvoidNonRegUnite','True');
invoke(Mesh,'ConsiderSpaceForLowerMeshLimit','False');
invoke(Mesh,'MinimumStepNumber','5');

MeshSettings = invoke(mws,'MeshSettings');
invoke(MeshSettings, 'SetMeshType','Hex');
invoke(MeshSettings, 'Set','RatioLimitGeometry','20');
MeshSettings = invoke(mws,'MeshSettings');    
invoke(MeshSettings, 'SetMeshType','HexTLM');
invoke(MeshSettings, 'Set','RatioLimitGeometry','20');
    
PostProcess1D = invoke(mws,'PostProcess1D');
invoke(PostProcess1D,'ActivateOperation','vswr','true');
invoke(PostProcess1D,'ActivateOperation','yz-matrices','true');
end