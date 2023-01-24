function DefineFarfieldMonitor(mws,Farfieldname, frequency)

%'@ define farfield monitor: farfield (f=2.25)

% Farfieldname is a string

Monitor = invoke(mws,'Monitor');
invoke(Monitor,'Reset');
invoke(Monitor,'Name',Farfieldname);
invoke(Monitor,'Domain','Frequency');
invoke(Monitor,'FieldType','Farfield');
invoke(Monitor,'Frequency',num2str(frequency));
invoke(Monitor,'UseSubvolume','False');
invoke(Monitor,'ExportFarfieldSource','False');
invoke(Monitor,'SetSubvolume','-53.310273111111', '53.310273111111', '-53.310273111111', '53.310273111111', '-33.310273111111', '71.310273111111');
invoke(Monitor,'Create');


end