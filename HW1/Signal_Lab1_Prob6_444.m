function Signal_Lab1_Prob6_444 ()
    cprintf('_blue','Generate Matrix X: \n');
    x = [[1:5]' zeros(5,3) [-1:-1:-5]'];
    disp(x);
    cprintf('_blue','Generate Matrix Y: \n');
    y = x'; 
    disp(y);
    cprintf('_blue','Generate Matrix Z: \n');
    z = x';
    z(1,4:5) = [2 1];
    z(5,4:5) = [-2 -1];
    disp(z);
    cprintf('_blue','Generate Matrix W: \n');
    w = [(2.*ones(5,1)).*x(:,1) 100+x(:,2:4) x(:,5)./(-10.*ones(5,1))]; 
    disp(w);
end