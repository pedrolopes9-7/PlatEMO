function memNSGAII(Global)
% <algorithm> <M>
% Memory Modificated Nondominated sorting genetic algorithm II
    %% Generate random population
    Population = Global.Initialization();
    [~,FrontNo,CrowdDis] = EnvironmentalSelection(Population,Global.N);
    Memory = LinkedHashMap(Population);

    %% Optimization
    while Global.NotTermination(Population)
        MatingPool = TournamentSelection(2,Global.N,FrontNo,-CrowdDis);
        Offspring  = GA(Population(MatingPool));
        [Population,FrontNo,CrowdDis] = EnvironmentalSelection([Population,Offspring],Global.N);
        InsertHash(Memory, Population);
    end
    PrintMemory(Memory);
end