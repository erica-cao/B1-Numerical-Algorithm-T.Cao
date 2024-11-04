% Define the function for which we want to find the root
f = @(x) sin(x);

% Set the interval [a, b] where we know π lies (approximately between 3 and 4)
a = 3;
b = 4;

% Set tolerance and maximum iterations
tolerance = 1e-6;
max_iterations = 1000;
iteration = 0;

% Bisection Method
while (b - a) / 2 > tolerance && iteration < max_iterations
    % Find the midpoint
    c = (a + b) / 2;
    
    % Check if midpoint is a root
    if f(c) == 0
        break; % c is the root
    elseif f(a) * f(c) < 0
        b = c; % Root is in the left half
    else
        a = c; % Root is in the right half
    end
    
    iteration = iteration + 1;
end

% Approximate value of π
pi_estimate = (a + b) / 2;
fprintf('Estimated value of π using Bisection Method: %.6f\n', pi_estimate);

% Known value of π in MATLAB
true_pi = pi;

% Calculate the absolute error
absolute_error = abs(pi_estimate - true_pi);
fprintf('Absolute Error: %.6e\n', absolute_error);

% Central Difference Estimation for Error Quantification
h = 1e-6; % Small perturbation
central_difference = (f(pi_estimate + h) - f(pi_estimate - h)) / (2 * h);
error_estimate = abs(central_difference * h);
fprintf('Central Difference Estimation of Error: %.6e\n', error_estimate);

