function memMOPSOCD(Global)
% <algorithm> <M>
% MOPSO with crowding distance and memory operator 
    %% Generate random population
    Population     = Global.Initialization();
    Archive        = UpdateArchive(Population,Global.N);
    Pbest          = Population;
    Memory         = LinkedHashMap(Population);
    
    %% Optimization
    while Global.NotTermination(Archive)
        Gbest            = Archive(randi(ceil(length(Archive)*0.1),1,Global.N));
        maximumCollision = EvaluateMemory(Memory);
        Population       = Operator(Population,Pbest,Gbest,maximumCollision);
        Archive          = UpdateArchive([Archive,Population],Global.N);
        Pbest            = UpdatePbest(Pbest,Population);   
    end
end