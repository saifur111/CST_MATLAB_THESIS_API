function DiscreteFacePort(mws,PortNumber,SetP1,SetP2)


DiscreteFacePort = invoke(mws,'DiscreteFacePort');

invoke(DiscreteFacePort,'Reset');
invoke(DiscreteFacePort,'PortNumber',int2str(PortNumber));
invoke(DiscreteFacePort,'Type','SParameter');
invoke(DiscreteFacePort,'Label','');
invoke(DiscreteFacePort,'Impedance','50');
invoke(DiscreteFacePort,'VoltagePortImpedance','0.0');
invoke(DiscreteFacePort,'VoltageAmplitude','1.0');
invoke(DiscreteFacePort,'SetP1','True',int2str(SetP1(1)),int2str(SetP1(2)),int2str(SetP1(3)));
invoke(DiscreteFacePort,'SetP2','True',int2str(SetP2(1)),int2str(SetP2(2)),int2str(SetP2(3)));
invoke(DiscreteFacePort,'LocalCoordinates','False');
invoke(DiscreteFacePort,'InvertDirection','False');
invoke(DiscreteFacePort,'CenterEdge','True');
invoke(DiscreteFacePort,'Monitor','True');
invoke(DiscreteFacePort,'UseProjection','False');
invoke(DiscreteFacePort,'ReverseProjection','False');
invoke(DiscreteFacePort,'Create');

release(DiscreteFacePort); 

end