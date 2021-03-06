function [ Max , Best_Set_Chromosome , Best_Set_Fitness ] = Best_Chromosome_Finder( Max , Fitness_Of_Population , Generation_Of_Chromosome , Best_Set_Chromosome , Best_Set_Fitness , Num_Of_Best )
[ Num_Of_Population , ~ ] = size(Generation_Of_Chromosome);



for i = 1:Num_Of_Population
    for j = 1:Num_Of_Best
        if Fitness_Of_Population( 1 , i ) > Best_Set_Fitness( 1 , j )
            Best_Set_Chromosome( j , : ) = Generation_Of_Chromosome( i , : );
            Best_Set_Fitness( 1 , j ) = Fitness_Of_Population( 1 , i );
            break;
        end
    end
end

[ Max1 , ~ ] = max(Fitness_Of_Population);
if Max1 > Max
    Max = Max1;
end
end

