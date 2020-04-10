function func_gramschmidt(A_matrix)
    [m,n]=size(A_matrix);
    for k=1:n
        V_matrix(:,k)=A_matrix(:,k);
        for j=1:k-1
            R(j,k)=V_matrix(:,j)'*A_matrix(:,k);
            V_matrix(:,k)=V_matrix(:,k)-R(j,k)*V_matrix(:,j);
        end
        R(k,k) = norm(V_matrix(:,k));
        V_matrix(:,k) = V_matrix(:,k)/R(k,k); 
    end
    disp(V_matrix,'Q=');
endfunction

function func_eigen(A_matrix)
    lam = poly(0,'lam')
    lam = lam
    charMat = A_matrix - lam*eye(3,3);
    disp(charMat,"Characteristic Matrix:")
    charPoly = poly(A_matrix,'lam')
    disp(charPoly,"Characteristic Polyomial:")
    lam = spec(A_matrix)
    disp(lam,"The Eigen Values:")
    [n,m] = size(A_matrix)
    x = []
    for k = 1:3
        B = A_matrix - lam(k)*eye(3,3);
        C = B(1:n-1,1:n-1);
        b = -B(1:n-1,n);
        y = C\b;
        y = [y;1];
        y = y/norm(y);
        x = [x y];
    end
    disp(x,"The Eigen Vectors are:");
endfunction

function func_rayleigh(A_matrix,U)
    u0 = U';
    disp(u0,'The initial vector is:');
    v = A_matrix*u0;
    a = max(u0);
    disp(a,'First approx.');
    while(abs(max(v)- a) > 0.002 )
        disp(v,"Current Eigen Vector is");
        a = max(v);
        disp(a,"Current Eigen Value is");
        u0 = v/max(v);
        v = A_matrix*u0;
    end
    format('v',4);
    disp(max(v),"The largest Eigen value is:");
    format('v',5);
    disp(u0,"Corresponding Eigen Vector");
endfunction

A_matrix = x_matrix("Enter Your matrix:",zeros(3,3));
func_gramschmidt(A_matrix);
A_matrix = x_matrix("Enter Your matrix:",zeros(3,3));
func_eigen(A_matrix);
A_matrix = x_matrix("Enter Your matrix:",zeros(3,3));
U = x_matrix("Enter matrix:",zeros(1,3));
func_rayleigh(A_matrix,U);