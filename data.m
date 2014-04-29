
N = 128;
q = 4;
reps = 10;

eps_interval = [0:.025:1];
eps_size = size(eps_interval, 2);

avg_iters = zeros(1, eps_size);
overlaps = zeros(1, eps_size);

count = 1;
for eps = eps_interval
    [iters, Q] = phasetransition(N, q, eps, reps);
    avg_iters(count) = iters;
    overlaps(count) = mean(Q);
    count = count+1;
        
end

save('phases1.mat', 'avg_iters', 'overlaps');