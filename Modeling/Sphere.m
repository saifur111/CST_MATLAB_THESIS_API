function Sphere(mws, Name, component, material, Axis, CenterRadius, TopRadius, BottomRadius, Center)


%'@ define sphere
% Axis is a string
Sphere = invoke(mws,'Sphere');
invoke(Sphere,'Reset');
invoke(Sphere,'Name', Name);
invoke(Sphere,'Component', component);
invoke(Sphere,'Material', material);
invoke(Sphere,'Axis', Axis);
invoke(Sphere,'CenterRadius', num2str(CenterRadius));
invoke(Sphere,'TopRadius', num2str(TopRadius));
invoke(Sphere,'BottomRadius', num2str(BottomRadius));
invoke(Sphere,'Center', num2str(Center(1)), num2str(Center(2)), num2str(Center(3)));
invoke(Sphere,'Segments', '0');
invoke(Sphere,'Create');     
    
end