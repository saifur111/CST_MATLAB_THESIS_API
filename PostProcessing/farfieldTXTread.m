function [combinedff] = farfieldTXTread(port,monitorindex)

fid   = fopen(strcat('farff',num2str(port),num2str(monitorindex),'.txt'));
scannedff = textscan(fid, '%f %f %f %f %f %f', 'Delimiter','Whitespace','HeaderLines',31);
fclose(fid);

farfield = cell2mat(scannedff);

farfield(:,4) = farfield(:,4)*1j;
farfield(:,6) = farfield(:,6)*1j;

combinedff = [farfield(:,1) farfield(:,2) sum(farfield(:,3:4),2) sum(farfield(:,5:6),2)];


end