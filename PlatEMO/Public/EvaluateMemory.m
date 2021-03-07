function maxSizeCollision = EvaluateMemory(map)
    keySet = keys(map);
    maxSizeCollision = 0;
    
    for i=1:length(keySet)
        value = map(keySet{i});
        if (length(value) >= 10)
            maxSizeCollision = length(value);
        end
    end
end
