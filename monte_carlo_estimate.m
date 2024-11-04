% Set up the number of samples and initialise variables
num_samples = 1e6;  % total number of points
estimates = zeros(1, num_samples);  % to store π estimates
inside_circle = 0;  % counter for points inside the circle

% Monte Carlo simulation for estimating π
for i = 1:num_samples
    % Generate random (x, y) points in the range [-1, 1]
    x = 2 * rand() - 1;
    y = 2 * rand() - 1;
    
    % Check if the point is inside the unit circle
    if x^2 + y^2 <= 1
        inside_circle = inside_circle + 1;
    end
    
    % Calculate the current estimate of π
    estimates(i) = 4 * (inside_circle / i);
end

% Plot the convergence of π estimates
figure;
plot(1:num_samples, estimates, 'b-');  % plot the estimates over iterations
hold on;
yline(pi, 'r--', 'True π');  % add a horizontal line for the true π value
title('Convergence of Monte Carlo Estimate of π');
xlabel('Number of Random Samples');
ylabel('Estimated Value of π');
legend('Monte Carlo Estimate', 'True π');
grid on;
hold off;
