function ExportTouchstone(mws,exportpath,format)


% format: use 'db', 'ri' or 'ma'
TOUCHSTONE = invoke(mws,'TOUCHSTONE');
invoke(TOUCHSTONE,'Reset');
invoke(TOUCHSTONE,'FileName',exportpath);
invoke(TOUCHSTONE,'Impedance','50');
invoke(TOUCHSTONE,'Format',format);
invoke(TOUCHSTONE,'FrequencyRange','full');
invoke(TOUCHSTONE,'Renormalize','True');
invoke(TOUCHSTONE,'UseARResults','False');
invoke(TOUCHSTONE,'SetNSamples','1001');
invoke(TOUCHSTONE,'Write');

end