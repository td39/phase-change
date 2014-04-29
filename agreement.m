function q = agreement(node_types, values, N)

    v = [1 2 3 4];
    P = perms(v);
    max_A = 0;
    
    for i = 1:size(P, 1)
        A = 0;
        for j = 1:N
            if node_types(j)==P(i, values(j))
                A = A+1;
            end
        end
        if A>max_A
            max_A = A;
        end
    end
    
    q = (max_A/N-.25)/(1-.25);
    
        
    
        
        
    