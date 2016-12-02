   function Signal_Lab1_Prob5_162 () 
    M = [[1:4];[-1:-1:-4];[1:4];[-1:-1:-4]];
%     ***************************************************************
    cprintf('_blue', 'a) Reflect array (M) left-side right: \n');
    out = M(:,[4:-1:1]);
    disp(out);
%     ***************************************************************
    cprintf('_blue','b) Reflect array (M) upside down: \n');
    out = M([4:-1:1],:);
    disp(out);
    
    cprintf('_blue','c) Swap columns 2 and 3 of array (M): \n');
    out = M;
    out(:,[3 2]) = out(:,[2 3]);
    disp(out);
    
    cprintf('_blue','d) Swap rows 1 and 4 of array (M): \n');
    out = M;
    out([4 1],:) = out([1 4],:);
    disp(out);
    
    cprintf('_blue','e) Shuffle the rows of (M) from [1 2 3 4] to [1 3 4 2] \n and shuffle the columns of(M) from [1 2 3 4] to [3 2 4 1]: \n');
    out = M([1 3 4 2],[3 2 4 1]);
    disp(out);
end