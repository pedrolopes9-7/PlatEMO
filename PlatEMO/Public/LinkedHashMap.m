function MAP = LinkedHashMap(Population)
    MAP = java.util.LinkedHashMap(20);    
    for i=1:length(Population)
        key = double2hash32bit(Population(i).obj);
        value = Population(i).obj;
        MAP.put(key, value);
    end
end