function [ Fitness_Of_Population ] = Fitness_Evaluation( Generation_Of_Chromosome , Num_Of_Population , Our_Criterian )
[ I , ~ ] = size(Generation_Of_Chromosome);
Fitness_Of_Population = zeros( 1 , Num_Of_Population );
for i = 1:I
    Fitness_Of_Population( 1 , i ) = Generation_Of_Chromosome( i , :) * Our_Criterian';
end
end

