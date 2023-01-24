function WaveguidePort(mws,PortNumber, Xrange, Yrange, Zrange, XrangeAdd, YrangeAdd, ZrangeAdd,Coordinates,Orientation)

%coordinates = 'Picks' or 'Full'
%orientation = 'positive' or 'xmax'
Port = invoke(mws,'Port');
invoke(Port,'Reset');
invoke(Port,'PortNumber',num2str(PortNumber));
invoke(Port,'Label','');
invoke(Port,'NumberOfModes','1');
invoke(Port,'AdjustPolarization','False');
invoke(Port,'PolarizationAngle','0.0');
invoke(Port,'ReferencePlaneDistance','0');
invoke(Port,'TextSize','50');
invoke(Port,'Coordinates',Coordinates);
invoke(Port,'Orientation',Orientation);
invoke(Port,'PortOnBound','False');
invoke(Port,'ClipPickedPortToBound','False');  
invoke(Port,'Xrange',int2str(Xrange(1)),int2str(Xrange(2)));
invoke(Port,'Yrange',int2str(Yrange(1)),int2str(Yrange(2)));
invoke(Port,'Zrange',int2str(Zrange(1)),int2str(Zrange(2)));
invoke(Port,'XrangeAdd',int2str(XrangeAdd(1)),int2str(XrangeAdd(2)));
invoke(Port,'YrangeAdd',int2str(YrangeAdd(1)),int2str(YrangeAdd(2)));
invoke(Port,'ZrangeAdd',int2str(ZrangeAdd(1)),int2str(ZrangeAdd(2)));
invoke(Port,'SingleEnded','False');
invoke(Port,'Create');
end 