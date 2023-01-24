function Cstcylinder(mws, Name, component, material, Axis, OuterRadius, InnerRadius, Xcenter, Ycenter, Zrange,Segments)

% Create a cylinder
% Name = Name of the cylinder (String) 'Solid1'
% component = component list (String) 'component1'
% material = 'PEC' or 'Vaccumm' otherwise you have to call the function of
% the material you want to use before this one
% Axis is a string e.g. 'Z'
% OuterRadius, InnerRadius, Xcenter, Ycenter are integers
% Zrange = starting and finishing range e.g. [0 10] (integers)

cylinder = invoke(mws,'Cylinder');
invoke(cylinder,'Reset');
invoke(cylinder,'Name',Name);
invoke(cylinder,'component',component);
invoke(cylinder,'Material',material);
invoke(cylinder,'Axis',Axis);

invoke(cylinder,'OuterRadius',int2str(OuterRadius));
invoke(cylinder,'InnerRadius',int2str(InnerRadius));
invoke(cylinder,'Segments',int2str(Segments));

if Axis =='Z'
invoke(cylinder,'Xcenter',int2str(Xcenter));
invoke(cylinder,'Ycenter',int2str(Ycenter));
invoke(cylinder,'Zrange',int2str(Zrange(1)),int2str(Zrange(2)));
elseif Axis =='X'
invoke(cylinder,'Ycenter',int2str(Ycenter));
invoke(cylinder,'Zcenter',int2str(Xcenter));
invoke(cylinder,'Xrange',int2str(Zrange(1)),int2str(Zrange(2)));
elseif Axis =='Y'
invoke(cylinder,'Xcenter',int2str(Xcenter));
invoke(cylinder,'Zcenter',int2str(Ycenter));
invoke(cylinder,'Yrange',int2str(Zrange(1)),int2str(Zrange(2)));  
end
    
    
    
    
invoke(cylinder,'Create');


release(cylinder);

end