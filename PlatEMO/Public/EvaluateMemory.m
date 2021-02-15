function maximumCollision = EvaluateMemory(Memory)
    maximumCollision = 0;
    it = Memory.entrySet().iterator();
    while (it.hasNext())
        listSize = it.next().size
        if (listSize(2) >= 15)
            maximumCollision = listSize;
            break
        end
    end
end
