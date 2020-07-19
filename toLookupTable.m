function table=toLookupTable(values)
    table = zeros(2^9, 1);
    
    for i = 1:2^9
        table(i) = false;
    end
    
    count = size(values);
    for i = 1:count
        val = values(i);
        table(val + 1) = true;
    end
        