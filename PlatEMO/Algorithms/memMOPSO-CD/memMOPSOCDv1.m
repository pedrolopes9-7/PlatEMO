function memMOPSOCD(Global)
% <algorithm> <M>
% MOPSO with crowding distance and memory operator 
    %% Generate random population
    Population     = Global.Initialization();
    Archive        = UpdateArchive(Population,Global.N);
    Pbest          = Population;
    Memory = containers.Map();
    UpdateMemory(Memory, Population);
    counter = 0;
    allC1 = [];
    allC2 = [];
    allW = [];
    
    %% Optimization
    while Global.NotTermination(Archive)
        Gbest            = Archive(randi(ceil(length(Archive)*0.1),1,Global.N));
        [Population,counter, C1, C2, W]       = Operator(Population,Pbest,Gbest,Memory,counter);
        allC1 = [allC1;C1];
        allC2 = [allC2;C2];
        allW = [allW;W];
        Archive          = UpdateArchive([Archive,Population],Global.N);
        Pbest            = UpdatePbest(Pbest,Population);
        UpdateMemory(Memory, Population);
        
        if (Global.gen == Global.maxgen)
            save('/home/sigma/Documents/MONOGRAFIA/PlatEMO/PlatEMO/Algorithms/memMOPSO-CD/parameters.mat', 'allC1', 'allC2', 'allW');
        end
    end
end