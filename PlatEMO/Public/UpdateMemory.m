function map = UpdateMemory(map, Population)
    for i=1:length(Population)
        key = int2str(double2hash32bit(Population(i).obj));
        
        if (isKey(map, key))
            values = map(key);
            values(end + 1, :) = Population(i).obj;
            map(key) = values;
        end
        
        if (~(isKey(map, key)))
            map(key) = Population(i).obj;
        end
    end
end