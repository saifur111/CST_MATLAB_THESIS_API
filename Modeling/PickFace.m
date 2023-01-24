function PickFace(mws,Name,id)

Pick = invoke(mws,'Pick');
invoke(Pick,'PickFaceFromId',strcat('component1:',Name),num2str(id));
end