function DiscretePort(mws,PortNumber,SetP1,SetP2)

DiscretePort = invoke(mws,'DiscretePort');
invoke(DiscretePort,'Reset');
invoke(DiscretePort,'PortNumber',int2str(PortNumber));
invoke(DiscretePort,'Type','SParameter');
invoke(DiscretePort,'Label','');
invoke(DiscretePort,'Impedance','50');
invoke(DiscretePort,'VoltagePortImpedance','0.0');
invoke(DiscretePort,'Voltage','1.0');
invoke(DiscretePort,'Current','1.0');
invoke(DiscretePort,'SetP1','False',int2str(SetP1(1)),int2str(SetP1(2)),int2str(SetP1(3)));
invoke(DiscretePort,'SetP2','False',int2str(SetP2(1)),int2str(SetP2(2)),int2str(SetP2(3)));
invoke(DiscretePort,'InvertDirection','False');
invoke(DiscretePort,'LocalCoordinates','False');
invoke(DiscretePort,'Monitor','True');
invoke(DiscretePort,'Radius','0.0'); 
invoke(DiscretePort,'Wire','');
invoke(DiscretePort,'Position','end1');
invoke(DiscretePort,'Create');
release(DiscretePort);    
end

