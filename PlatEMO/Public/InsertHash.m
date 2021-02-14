function key = InsertHash(Map, Population)
    Map.clear()
    for i=1:length(Population)
        individual = Population(i);
        key = double2hash32bit(individual.obj);
        value = individual.obj;
        Map.put(key, value);
    end
end