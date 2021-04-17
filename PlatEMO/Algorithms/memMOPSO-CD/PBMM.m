function [Offspring,counter,allC1, allC2, allW] = Operator(Particle,Pbest,Gbest,Memory,counter)
% Particle swarm optimization in MOPSO-CD

%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------

    %% Parameter setting
    ParticleDec = Particle.decs;
    PbestDec    = Pbest.decs;
    GbestDec    = Gbest.decs;
    [N,D]       = size(ParticleDec);
    ParticleVel = Particle.adds(zeros(N,D));
    Global      = GLOBAL.GetObj();
    allC1 = 0;
    allC2 = 0;
    allW = 0;

    %% Particle swarm optimization
    r1 = repmat(rand(N,1),1,D);
    r2 = repmat(rand(N,1),1,D);
    maximumCollision = EvaluateMemory(Memory);
    L = 15
    
    if (maximumCollision > L)
        remove(Memory, keys(Memory));
        counter = counter + 1;
    end
    
    C1 = repmat(1.5,1,D);
    C2 = repmat(2.5,1,D);
    W  = repmat(0.2,1,D);
    
    a1 = 0.05
    a2 = 0.07
    
    k = unifrnd(a1,a2)

    C1 = C1 + k * counter
    C2 = C2 - k * counter
    W = W + k * counter
    
    if (C1 + C2 > 5.5 | C2 < 1.0 | C1 > 3.0 | W > 1.2)
        counter = counter - 2;
    end
    
    allC1 = C1(1);
    allC2 = C2(1);
    allW = W(1);
        
    OffVel = W.*ParticleVel + C1.*r1.*(PbestDec-ParticleDec) + C2.*r2.*(GbestDec-ParticleDec);
    OffDec = ParticleDec + OffVel;
    
    %% Deterministic back
    Lower  = repmat(Global.lower,N,1);
    Upper  = repmat(Global.upper,N,1);
    repair = OffDec < Lower | OffDec > Upper;
    OffVel(repair) = -OffVel(repair);
    OffDec = max(min(OffDec,Upper),Lower);
    
    %% Polynomial mutation
    if Global.evaluated <= Global.evaluation*0.5
        disM = 20;
        Site = rand(N,D) < 1/D;
        mu   = rand(N,D);
        temp = Site & mu<=0.5;
        OffDec(temp) = OffDec(temp)+(Upper(temp)-Lower(temp)).*((2.*mu(temp)+(1-2.*mu(temp)).*...
                       (1-(OffDec(temp)-Lower(temp))./(Upper(temp)-Lower(temp))).^(disM+1)).^(1/(disM+1))-1);
        temp  = Site & mu>0.5; 
        OffDec(temp) = OffDec(temp)+(Upper(temp)-Lower(temp)).*(1-(2.*(1-mu(temp))+2.*(mu(temp)-0.5).*...
                       (1-(Upper(temp)-OffDec(temp))./(Upper(temp)-Lower(temp))).^(disM+1)).^(1/(disM+1)));
    end
    Offspring = INDIVIDUAL(OffDec,OffVel);
end