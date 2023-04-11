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

% Calculate the clustering coefficient of each node
num_nodes = size(adjacency_matrix, 1);
clustering_coefficient = zeros(num_nodes, 1);
for i = 1:num_nodes
    neighbors = find(adjacency_matrix(i,:));  % Find the neighbors of node i
    num_neighbors = length(neighbors);
    if num_neighbors >= 2
        edges = 0;
        for j = 1:num_neighbors
            for k = j+1:num_neighbors
                edges = edges + adjacency_matrix(neighbors(j),neighbors(k));
            end
        end
        clustering_coefficient(i) = 2*edges/(num_neighbors*(num_neighbors-1));
    end
end

% Calculate the average clustering coefficient of the network
avg_clustering_coefficient = mean(clustering_coefficient(clustering_coefficient > 0));

% Display the clustering coefficient of each node and the average clustering coefficient of the network
disp('Node clustering coefficients:');
disp(clustering_coefficient');
disp(['Average clustering coefficient: ' num2str(avg_clustering_coefficient)]);