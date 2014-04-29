function [node_types, A] = adjmat(N, q, eps)


   c_in = 64/(1+3*eps);
   c_out = eps*c_in;
   n_a = 1/q;
   
   node_types = zeros(1, N);
   node_types(1:N/4)=1;
   node_types(N/4+1:N/2)=2;
   node_types(N/2+1:3*N/4)=3;
   node_types(3*N/4+1:N)=4;
   
   A=zeros(N,N);
   
   for i = 1:N
       for j = i+1:N
           if node_types(i) == node_types(j)
               if unifrnd(0,1) < c_in/N
                   A(i, j) = 1;
                   A(j, i) = 1;
               end
           else 
               if unifrnd(0,1) < c_out/N
                   A(i, j) = 1;
                   A(j, i) = 1;
               end
           end
       end
   end
         
end
