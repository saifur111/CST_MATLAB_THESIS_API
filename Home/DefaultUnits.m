function DefaultUnits(mws)

%define units (Default selection)
Geometry = 'mm';
Frequency = 'GHz';
Time = 'ns';
TemperatureUnit = 'Kelvin';
Voltage = 'V';
Current = 'A';
Resistance = 'Ohm';
Conductance  = 'S';
Capacitance = 'PikoF';
Inductance = 'NanoH';

Units = invoke(mws,'Units');
invoke(Units,'Geometry',Geometry);
invoke(Units,'Frequency',Frequency);
invoke(Units,'Time',Time);
invoke(Units,'TemperatureUnit',TemperatureUnit);
invoke(Units,'Voltage',Voltage);
invoke(Units,'Current',Current);
invoke(Units,'Resistance',Resistance);
invoke(Units,'Conductance',Conductance);
invoke(Units,'Capacitance',Capacitance);
invoke(Units,'Inductance',Inductance);

end



