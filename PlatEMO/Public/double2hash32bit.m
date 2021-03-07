function KEY = double2hash32bit(Individual)
    %Implements 32-bit Pearson Hash Function
    
    lookUpTable = [97  234  123   44  187  180  131  141   33  246  134  166  232  193   88  211  244  170    8  230  251  160  113  250   80  237   20  208  240  220  161    6  255    7   81  198  124  137  149  179  227   82   18  162  139   87   30   72  163   66  214  194  177  209  224  140   85   17  136  236   48   73  138  158  154  215  128  228   58    5  104  231   35  111   32   47  153  143  203  183  243  245  226  182  238   78   61  196   45  242  184  213   29  191   38  210  133   11   57   52   25   40   54  178    9   74  204  157   46   50   63  233   43   36  148  192   10  239  205  185  218  102  126   24  135  150   86   84  105  146  247  176   69   28  212    3   21  101   22  254   79  147  144  200    1  129  189   90  223  155  165  107  122  120   93  110   31   71  225   99  132  164  114   13  130  249  142  156  186  115  195  112   62   26  217   83   41   37  145   19   92   42  201    2  168  116  222   39  169  109   27  221   75   34   56  248   12  206   65  119   53   14  252  175   77   59  103   55   94  207   49   76  256   64  188  127  108   89  151  190  174  171   23   67  125   98  152   95   70   51  117  229  235  197  106  253  216  219  121   91  167   15  172  181  159   60   16  118  173  199   96   68  100    4  241  202];
    concatIndividual = "";
    
    for k = 1:length(Individual)
        concatIndividual = concatIndividual + num2str(Individual(k));
    end
    
    string = strrep(concatIndividual, '.', '');
    string = strrep(string, 'e', '');
    string = strrep(string, '-', '');
    string = strrep(string, '0', '');
    
    tableIndex = mod(int64(str2double(string)),256);

    if tableIndex==0
        tableIndex= randi([1 255],1,1);
    end
            
    if tableIndex>255 
        tableIndex = randi([1 255],1,1);
    end
    
    KEY = lookUpTable(tableIndex);
end

