function Signal_Lab1_Prob7_162 ()
    A = zeros(5);
    B = zeros(5,1);
    A = [2 3 5 6 21;5 0 2 2 0;6 7 8 9 11;0 13 17 5 6;1 4 0 3 9];
    prompt = 'Enter Vector (B) (Enter as row vector):  ';
    B = input(prompt);
    augA = [A B'];
    rankA = rank(augA);
    
%     if the rank of equal to number of unknowns so each vairable
%     has a unique solution
    
    S = rankA == 5 ;
    if S == 1
        fprintf('S = ');cprintf('*comment','true \n');
    else
        fprintf('S = ');cprintf('*red','false \n');
    end
    sol = rref(augA);
    for i=1:5 
        fprintf('x%d = %d \n',i,sol(i,end));
    end
end