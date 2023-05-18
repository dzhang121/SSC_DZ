

x = sym('x','real');

%example
A = sym([0 1 0;0 0 1 ; 0 -1 -1.414]','d');
polyA = charpoly(A,x)
eigenA = solve(polyA)

%for closed loop (optimal) controller
AnewS= sym(Anew,'d');
poly= charpoly(AnewS,x)
eigenV = solve(poly)

%observer
matrix= sym(A','d');
poly= charpoly(matrix,x)
eigenV = solve(poly)



%pole placement - characteristic equation
expand((x+329)*(x+(19.9-17.3i))*(x+(19.9+17.3i)))