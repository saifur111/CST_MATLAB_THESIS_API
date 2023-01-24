function PickEdge(mws,ComponentName,position)
Pick = invoke(mws,'Pick');
invoke(Pick,'PickEdgeFromId',strcat('component1:',ComponentName),num2str(position),num2str(position));
end