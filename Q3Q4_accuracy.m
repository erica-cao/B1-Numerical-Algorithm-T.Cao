% Set up the number of samples and initialize variables
num_samples = 1e5;  % total number of points
estimates = zeros(1, num_samples);  % to store π estimates
errors = zeros(1, num_samples);  % to store error estimates
inside_circle = 0;  % counter for points inside the circle

% Monte Carlo simulation with error estimation
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
    
    % Calculate the sample variance and standard error
    variance = (4^2) * (inside_circle / i) * (1 - (inside_circle / i));
    errors(i) = sqrt(variance / i);  % Standard error
end

% Plot the convergence of π estimates with error bars
figure;
plot(1:num_samples, estimates, 'b-');  % plot the estimates over iterations
hold on;
yline(pi, 'r--', 'True π');  % add a horizontal line for the true π value
errorbar(1:1000:num_samples, estimates(1:1000:end), errors(1:1000:end), 'k.');  % error bars
title('Convergence of Monte Carlo Estimate of π with Error Bars');
xlabel('Number of Random Samples');
ylabel('Estimated Value of π');
legend('Monte Carlo Estimate', 'True π', 'Error Bars');
grid on;
hold off;
