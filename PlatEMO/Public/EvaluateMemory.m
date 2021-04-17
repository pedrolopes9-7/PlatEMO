function maxSizeCollision = EvaluateMemory(map)
    keySet = keys(map);
    maxSizeCollision = 0;
    occurenceMatrix = [];
    matrix = [];
    
    for i=1:length(keySet)
        value = map(keySet{i});
        matrix = [matrix; value];
    end
    
    [Mu,ia,ic] = unique(matrix, 'rows', 'stable');
    h = accumarray(ic, 1);
    maph = h(ic);
    occurenceMatrix = [matrix, maph];
    
    maxSizeCollision = max(occurenceMatrix(:,length(occurenceMatrix(1,:))));
end
