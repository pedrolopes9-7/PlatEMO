function [] = EvaluateMemory(Memory)
    it = Memory.entrySet().iterator();
    while (it.hasNext())
        pair = it.next();
        disp(pair.getKey());
        disp(pair.getValue());
    end
end
