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
disp('Node degrees:');
disp(degree');