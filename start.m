% Milad Khademi Nori    95123012
% A quantum-inspired gravitational search algorithm for binary encoded optimization problems
% Tested by Knapsack Problem

% Initialization
% Observation
% Fitness evaluation
% Updating SB(t)
% Computing Mi(t)
% Updating Q(t)
% Repeat
clear all
    %% Initialization
Num_Of_Population = 60 ;
Num_Of_Genes = 50 ;
Num_Of_Best = 10 ;
Num_Of_Iteration = 100 ;
G_Constant = 10;
Our_Criterian = 2*rand( 1 , Num_Of_Genes ) - 1;
Best_Set_Chromosome = zeros( Num_Of_Best , Num_Of_Genes );
Best_Set_Fitness = zeros( 1 , Num_Of_Best );
Generation_Of_Chromosome_Betas = 2*rand ( Num_Of_Population , Num_Of_Genes ) - 1;
Generation_Of_Chromosome_Alphas = 1 - Generation_Of_Chromosome_Betas.^2 ;
Generation_Of_Chromosome_Velocity = zeros ( Num_Of_Population , Num_Of_Genes );
History_Of_Fitness_Improvement = zeros ( 1 , Num_Of_Iteration);
Max = 0;

%%
for i = 1 : Num_Of_Iteration
    % Observation
[ Generation_Of_Chromosome ] = Chromosome_Generator( Generation_Of_Chromosome_Betas , Num_Of_Population , Num_Of_Genes );

    % Fitness evaluation
[ Fitness_Of_Population ] = Fitness_Evaluation( Generation_Of_Chromosome , Num_Of_Population , Our_Criterian );

    % Updating SB(t)
[ Max , Best_Set_Chromosome , Best_Set_Fitness ] = Best_Chromosome_Finder( Max , Fitness_Of_Population , Generation_Of_Chromosome , Best_Set_Chromosome , Best_Set_Fitness , Num_Of_Best );
History_Of_Fitness_Improvement ( 1 , i ) = Max;
    % Computing Mi(t)
% nothing

    % Updating Q(t)
[ Generation_Of_Chromosome_Alphas , Generation_Of_Chromosome_Betas , Generation_Of_Chromosome_Velocity ] = Update_Of_Betta( Generation_Of_Chromosome_Alphas , Num_Of_Population , Num_Of_Best , Num_Of_Genes , Generation_Of_Chromosome , Generation_Of_Chromosome_Velocity , Generation_Of_Chromosome_Betas , Best_Set_Chromosome , Best_Set_Fitness, G_Constant );
    
    % Repeat
G_Constant = G_Constant * ( 1 - (i/Num_Of_Iteration) );
    
end
plot ( 1:Num_Of_Iteration , History_Of_Fitness_Improvement)

milad123=floor(Our_Criterian)+1;
milad1234 = milad123 == Best_Set_Chromosome(1,:);
precision = sum(milad1234)/Num_Of_Genes
