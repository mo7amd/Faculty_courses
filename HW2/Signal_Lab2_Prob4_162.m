function Signal_Lab2_Prob4_162 ()
    
%     as |t|<40 so -40<t<40 with step 2 as T=2 ; 
    t=[-4:2:40];
%     replace each n with tT
    x=cos((4/3)*t);
    y=cos((8/19)*pi*t);
    
    figure;
    subplot(1,2,1);
    xlabel('x(n)');
    stem(t,x);
%     not periodic
%     **********************************************************
    subplot(1,2,2);
    xlabel('y(n)');
    stem(t,y);
%     periodic T = 19 , cycles = 2
end