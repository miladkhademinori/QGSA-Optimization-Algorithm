function [ Generation_Of_Chromosome ] = Chromosome_Generator( Generation_Of_Chromosome_Betas , Num_Of_Population , Num_Of_Genes )
[ I , J ] = size(Generation_Of_Chromosome_Betas);
Generation_Of_Chromosome = zeros ( Num_Of_Population , Num_Of_Genes);
for i = 1 : I
    for j = 1 : J
       if rand < (Generation_Of_Chromosome_Betas( i , j )^2)
        Generation_Of_Chromosome ( i , j ) = 1;
       else
        Generation_Of_Chromosome ( i , j ) = 0;   
       end
    end
end
end

