% Oscar I. Ricaud Math 4329: Numerical Analysis
% function secant(x0, x1, error_bd, max_iterate)

% This implements the secant method for solving an equation
% f(x) = 0.

% The parameter error_bd is used in the error test for the
% accuracy of each iterate. The parmeter max_iterate is 
% an upper limit on the number of iterates to be computed.
% Two initial guesses, x0 and x1 must also be given.

% For the given function f(x), an example of a calling 
% sequence might be the following:
% 		root = secant(x0, x1, 1.0E-12, 10)
% The function f(x) is given below.

% The program prints the iteration values
% 		iterate_number, x, f(x), error
% The value of x is the most current initial guess, called 
% previous_iterate here, and it is updated with each iteration.
% The value of error is 
% 	error = newly_computed_iterate - previous_iterate.
% 	Tap the carraige return to continue with iteration.
function root = Secant_Method_Oscar_I_Ricaud(x0,x1,error_bd, max_iterate)
format short e
error = 1;
fx0 = f(x0);
it_count = 0;
iteration = [it_count x0 fx0]
disp('[n, x, f(x), error]')

while abs(error) > error_bd & it_count<= max_iterate
	it_count = it_count + 1;
	fx1 = f(x1);
	if fx1 - fx0 == 0
		disp('f(x1) = f(x0); Division by zero; Stop')
		return
	end
	x2 = x1 - fx1*(x1-x0)/(fx1-fx0);
	error = x2 - x1;
% Internal print of secant method. Tap the carriage
% return key to continue the computation.
iteration = [it_count x1 fx1 error]
pause
x0 = x1;
x1 = x2;
fx0 = fx1;
end

if it_count > max_iterate
	disp('The number of iterates calculated exceed')
	disp('max_iterate. An accurate root was not')
	disp('calculated')
else
	format long
	root = x2
	format short
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function value = f(x)
%
% function to define equation for rootfinding problem.
value = x.^3-3*x.^2+3*x-1;


