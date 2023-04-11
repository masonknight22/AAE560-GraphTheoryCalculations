A = [
    0 1 0 1 0 0 0 0 0 0 0;
	1 0 0 1 0 0 0 0 0 0 0;
	0 1 0 1 1 0 0 0 0 0 0;
	1 0 1 0 1 1 0 0 0 0 0;
	0 1 1 1 0 1 0 0 0 0 0;
	0 0 0 1 1 0 1 1 0 0 0;
	0 0 0 0 0 1 0 1 1 0 0;
	0 0 0 0 0 1 1 0 1 1 0;
	0 0 0 0 0 0 1 1 0 1 1;
	0 0 0 0 0 0 0 1 1 0 1;
	0 0 0 0 0 0 0 0 1 1 0;
    ];

% number of nodes in the network
n = size(A,1);

% initialize betweenness centrality vector for all nodes
BC = zeros(n,1);

% loop over all nodes
for s = 1:n
    % initialize variables for BFS
    queue = [];
    visited = zeros(n,1);
    dist = -1*ones(n,1);
    paths = cell(n,1);
    paths(:) = {[]};
    num_paths = zeros(n,1);
    num_paths(s) = 1;
    dist(s) = 0;
    visited(s) = 1;
    queue = [queue; s];
    
    % BFS algorithm to find shortest paths and number of paths
    while ~isempty(queue)
        v = queue(1);
        queue(1) = [];
        for w = find(A(v,:))
            if visited(w) == 0
                visited(w) = 1;
                dist(w) = dist(v) + 1;
                queue = [queue; w];
            end
            if dist(w) == dist(v) + 1
                num_paths(w) = num_paths(w) + num_paths(v);
                paths{w} = [paths{w}; v];
            end
        end
    end
    
    % calculate betweenness centrality
    delta = zeros(n,1);
    for w = n:-1:1
        for v = paths{w}'
            delta(v) = delta(v) + (num_paths(v)/num_paths(w))*(1 + delta(w));
        end
        if w ~= s
            BC(w) = BC(w) + delta(w);
        end
    end
end

% betweenness centrality of node 1
BC(1)