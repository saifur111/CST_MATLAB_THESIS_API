function DefineHfieldMonitor(mws,Hfieldname, frequency)

%'@ define monitor: e-field (f=2.25)
% Efieldname is a string

Monitor = invoke(mws,'Monitor');
invoke(Monitor,'Reset');
invoke(Monitor,'Name',Hfieldname);
invoke(Monitor,'Dimension','Volume');
invoke(Monitor,'Domain','Frequency');
invoke(Monitor,'FieldType','Hfield');
invoke(Monitor,'Frequency',num2str(frequency));
invoke(Monitor,'UseSubvolume','False');
invoke(Monitor,'SetSubvolume','-209.896229', '229.896229', '-179.896229', '179.896229', '-149.896229', '187.896229');
invoke(Monitor,'Create');


end
