function [ Generation_Of_Chromosome_Alphas , Generation_Of_Chromosome_Betas , Generation_Of_Chromosome_Velocity ] = Update_Of_Betta( Generation_Of_Chromosome_Alphas , Num_Of_Population , Num_Of_Best , Num_Of_Genes , Generation_Of_Chromosome , Generation_Of_Chromosome_Velocity  , Generation_Of_Chromosome_Betas , Best_Set_Chromosome , Best_Set_Fitness , G_Constant )

Generation_Of_Chromosome_Acceleration = zeros ( Num_Of_Population , Num_Of_Genes);
Distance_Matrix = zeros ( Num_Of_Population , Num_Of_Best);
M = Best_Set_Fitness;
[Minimum , ~ ] = min(Best_Set_Fitness);
M = M - Minimum;
M = M / sum(M');

for w = 1:Num_Of_Population
    for y = 1:Num_Of_Best
        Distance_Matrix( w , y ) = pdist([ Generation_Of_Chromosome( w , : ) ; Best_Set_Chromosome( y , : ) ],'hamming');
    end
end

temp = 0;
for i = 1:Num_Of_Population
    for  k = 1:Num_Of_Genes
        for j = 1:Num_Of_Best 
            temp = G_Constant * (M( 1 , j )) * (Best_Set_Chromosome( j , k ) - Generation_Of_Chromosome( i , k ) )/(Distance_Matrix( i , j ) + 0.000000001);
            Generation_Of_Chromosome_Acceleration( i , k) = Generation_Of_Chromosome_Acceleration( i , k) + temp;
            
        end
    end
end

% for h = 1:Num_Of_Population
%     for g = 1 : Num_Of_Genes
%         Generation_Of_Chromosome_Velocity( h , g ) = rand
%     end
% end
Generation_Of_Chromosome_Velocity = rand * Generation_Of_Chromosome_Acceleration + Generation_Of_Chromosome_Velocity;

for s  = 1:Num_Of_Population 
   for u  = 1:Num_Of_Genes
       if Generation_Of_Chromosome_Betas( s , u )*Generation_Of_Chromosome_Alphas( s , u ) > 0
           [theta,~] = cart2pol(Generation_Of_Chromosome_Alphas( s , u ) , Generation_Of_Chromosome_Betas( s , u ) );
           theta = theta + Generation_Of_Chromosome_Velocity( s , u );
           [Generation_Of_Chromosome_Alphas( s , u ) , Generation_Of_Chromosome_Betas( s , u ) ] = pol2cart(theta,1);
           
       else
           [theta,~] = cart2pol(Generation_Of_Chromosome_Alphas( s , u ) , Generation_Of_Chromosome_Betas( s , u ) );
           theta = theta - Generation_Of_Chromosome_Velocity( s , u );
           [Generation_Of_Chromosome_Alphas( s , u ) , Generation_Of_Chromosome_Betas( s , u ) ] = pol2cart(theta,1);
           
       end
    
   end
end



%Generation_Of_Chromosome_Betas = sin(asin(Generation_Of_Chromosome_Betas) + Generation_Of_Chromosome_Velocity );

end

