
function [sbd, Nodes, iters] = SBD(A, eps)
    
    %Size of Adjacency Matrix
    numNodes = size(A,2);
    
    % Defining Bare Factor Graph, Node Object, and Node Type Domain
    sbd = FactorGraph();
    Domain = [1:4];
    Nodes = Discrete(Domain, numNodes, 1);
    
    %Adding Probability Factors joining Factor Nodes
    disp('Start');
    for i = 1:numNodes
        for j = i+1:numNodes
            sbd.addFactor(@sbdFactor, Nodes(i), Nodes(j), eps, A(i, j), numNodes);
        end
    end
    disp('Done');
    
    %Randomly Initializing Node Types
    low = [0 0 0 0];
    high = [1 1 1 1];
    for i=1:numNodes
        vec = unifrnd(low, high);
        Nodes(i).Input = vec./norm(vec);
    end
    
    %Performing Full BP on Factor Graph Until Convergence of Marginals
    criterium = .1;
    conv = 10;
    current_beliefs = Nodes.Belief;
    iters = 0;
    while (conv>criterium && iters<200)
        past_beliefs = current_beliefs;
        sbd.Solver.iterate();
        iters = iters+1;
        current_beliefs = Nodes.Belief;
        conv = norm(current_beliefs-past_beliefs);  
    end  
end


function [prob] = sbdFactor(state1, state2, eps, A_ij, numNodes)

    %Probability Function in Generative Model for Edge Joining Two Nodes
    c_in = 64/(1+3*eps);
    c_out = eps*c_in;
    if A_ij == 1
        if state1 == state2 
            prob=c_in/numNodes;
        else
            prob=c_out/numNodes;
        end
    else
        if state1 == state2
            prob=1-c_in/numNodes;
        else
            prob=1-c_out/numNodes;
        end
    end  
end
