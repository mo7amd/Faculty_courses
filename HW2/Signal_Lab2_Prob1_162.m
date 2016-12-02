function Signal_Lab2_Prob1_162 ()
    
    t1=linspace(-2,0,200);
    t2=linspace(0,1,100);
    t3=linspace(1,3,200);
    
    x1=4*ones(1,200);
    x2=4 + t2.*sin(-pi*0.5*t2);
    x3=3*ones(1,200);
    
    x=[x1 x2 x3];
    t=[t1 t2 t3];
    
    figure;
    axis([0 6 0 6]);
    plot(t,x);
    
    figure;
    axis([0 6 0 6]);
    stem(t,x);
end
