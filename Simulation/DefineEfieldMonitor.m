function DefineEfieldMonitor(mws,Efieldname, frequency)

%'@ define monitor: e-field (f=2.25)
% Efieldname is a string

Monitor = invoke(mws,'Monitor');
invoke(Monitor,'Reset');
invoke(Monitor,'Name',Efieldname);
invoke(Monitor,'Dimension','Volume');
invoke(Monitor,'Domain','Frequency');
invoke(Monitor,'FieldType','Efield');
invoke(Monitor,'Frequency',num2str(frequency));
invoke(Monitor,'UseSubvolume','False');
invoke(Monitor,'SetSubvolume','-53.310273111111', '53.310273111111', '-53.310273111111', '53.310273111111', '-33.310273111111', '71.310273111111');
invoke(Monitor,'Create');


end

