adjacency_matrix = [
    0 1 1 1 0 0;
    1 0 0 0 1 0;
    1 0 0 1 1 0;
    1 0 1 0 1 1;
    0 1 1 1 0 0;
    0 0 0 1 0 0;
];

%Calculate the degree of each node
k = sum(adjacency_matrix, 2);

%Calculate the sum of degrees
sum_k = sum(k);

%Caclulate the probability fo attachment of he new node to each existing
%node
p = k / sum_k;

%Generate a random number between 0 and 1
r = rand();

%Iterate ove rthe existing nodes, and find the node to attach to
for i = 1:length(p)
    r = r - p(1);
    if r < 0
        %Node i is the chosen node to attach to 
        fprintf('New node attached to node %d|n', i);
        break;
    end
end