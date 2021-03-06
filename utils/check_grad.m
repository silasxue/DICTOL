function flag = check_grad(fn, grad, Xtest)
    %% Numerical grad 
    function g = num_grad(X)
        ep = 1e-4;
        g = zeros(size(X));
        for i = 1: size(X, 1)
            for j = 1: size(X,2)
                Xp = X;
                Xm = X;
                Xp(i,j) = Xp(i,j) + ep; fp = feval(fn, Xp);
                Xm(i,j) = Xm(i,j) - ep; fm = feval(fn, Xm);
                g(i,j)  = (fp - fm) / (2*ep);
            end 
        end 
    end 
    %%
    Xtest = rand(size(Xtest));
    grad1 = feval(grad, Xtest);
    grad2 = num_grad(Xtest);
    dif1 = norm(grad1 - grad2);
    fprintf('Checking gradient...\n');
    fprintf('==============================================================\n');
    fprintf('Different between two grads: norm(grad - num_grad) = %5f \n', dif1);
    fprintf('==============================================================\n');
    flag = abs(dif1) < 1e-5;
    
end 

 