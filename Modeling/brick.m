function brick(mws, Name, component, material, Xrange, Yrange, Zrange)

% Create a brick
% Name = Name of the brick (String) 'Solid1'
% component = component list (String) 'component1'
% material = 'PEC' or 'Vaccumm' otherwise you have to call the function of
% the material you want to use before this one
% Xrange, Yrange, Zrange = starting and finishing range e.g. [0 10] (integers) 

brick = invoke(mws,'Brick');
invoke(brick,'Reset');
invoke(brick,'Name',Name);
invoke(brick,'component',component);
invoke(brick,'Material',material);


invoke(brick,'Xrange',int2str(Xrange(1)),int2str(Xrange(2)));
invoke(brick,'Yrange',int2str(Yrange(1)),int2str(Yrange(2)));
invoke(brick,'Zrange',int2str(Zrange(1)),int2str(Zrange(2)));


invoke(brick,'Create');

release(brick);

end