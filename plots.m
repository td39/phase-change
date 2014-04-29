load('phases_data.mat');

scatter(eps_interval, overlaps, 180, 'r', 'x', 'LineWidth', 4)
xlabel('\epsilon=c_{out}/c_{in}', 'FontSize', 30)
xlabh = get(gca,'XLabel');
set(xlabh,'Position',get(xlabh,'Position') - [0 .02 0])
ylabel('Overlap', 'FontSize', 30)
axes_handle = gca;
set(axes_handle, 'FontSize', 20);
title('Overlap of Original and Learned Node Types vs. Out/In Node Connectivities',... 
  'FontWeight','bold')
str1(1)= {'N=128 Nodes'};
str1(2) = {'q=4 Node Types'}; 
str1(3) = {'c=16 Average Node Degree'};
str1(4) = {'Averaged over 20 Samples'};
text(.5,.5,str1,'FontSize',24)

%{
scatter(eps_interval, avg_iters, 180, 'r', 'x', 'LineWidth', 4)
xlabel('\epsilon=c_{out}/c_{in}', 'FontSize', 30)
xlabh = get(gca,'XLabel');
set(xlabh,'Position',get(xlabh,'Position') - [0 3 0])
ylabel('Time (BP Iterations)', 'FontSize', 30)
axes_handle = gca;
set(axes_handle, 'FontSize', 20);
title('Convergence Time of Sum-Product vs. Out/In Node Connectivities',... 
  'FontWeight','bold')
str1(1)= {'N=128 Nodes'};
str1(2) = {'q=4 Node Types'}; 
str1(3) = {'c=16 Average Node Degree'};
str1(4) = {'Averaged over 20 Samples'};
text(.6,80,str1,'FontSize',24)
%}
