function [] = InsertHash(Map, Population)
    for i=1:length(Population)
        key = double2hash32bit(Population(i).obj);
        value = Population(i).obj;
        Map.put(key, value);
    end
end