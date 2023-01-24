function PickMidPoint(mws,Name,id)

Pick = invoke(mws,'Pick');
invoke(Pick,'PickMidpointFromId',strcat('component1:',Name),num2str(id));
end