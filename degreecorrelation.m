degrees = [10 1 2 1 2 1 2 1 2 1 5];

n = length(degrees);
P = zeros(max(degrees)+1);
for i = 1:n
    for j = (i+1):n
        if A(i,j) == 1
            k = degrees(i);
            l = degrees(j);
            P(k+1,l+1) = P(k+1,l+1) + 1;
            P(l+1,k+1) = P(l+1,k+1) + 1;
        end
    end
end
corr = (sum(sum((P - sum(P,1)'*sum(P,2)).^2)))/(sum(degrees.^2) - sum(degrees)^2/sum(sum(A)));
