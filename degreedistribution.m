adjacency_matrix = [
    0 1 1 1 0 0 0 0;
    1 0 0 0 1 0 0 0;
    1 0 0 1 1 0 0 0;
    1 0 1 0 1 1 1 1;
    0 1 1 1 0 0 0 0;
    0 0 0 1 0 0 0 0;
    0 0 0 1 0 0 0 0;
    0 0 0 1 0 0 0 0
];

% degree of each node
degree = sum(adjacency_matrix, 2);

% Calculate the degree distribution
max_degree = max(degree);
degree_distribution = zeros(max_degree+1, 1);
for i = 0:max_degree
    degree_distribution(i+1) = sum(degree == i);
end

% Plot the degree distribution
plot(0:max_degree, degree_distribution, '-o');
xlabel('Degree');
ylabel('Number of nodes');
title('Degree distribution');