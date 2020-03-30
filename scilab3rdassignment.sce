function[C_output_matrix,D_output_matrix]=bestfitfunction(A_matrix,B_matrix)
    x=(A_matrix'*A_matrix)\(A_matrix'*B_matrix);
    C_output_matrix=x(1,1);
    D_output_matrix=x(2,1);
endfunction

A_matrix = x_matrix("Enter matrix:",zeros(3,2));
B_matrix = x_matrix("Enter matrix:",zeros(3,1));

[C_output_matrix,D_output_matrix] = bestfitfunction(A_matrix,B_matrix);

disp(B_matrix, 'B_matrix=');
disp(C_output_matrix, 'C_output_matrix=');
disp(D_output_matrix, 'D_output_matrix=');
disp('The Best Fit Line is b=C_output_matrix+Dt=');
printf('b=%f + %ft',C_output_matrix,D_output_matrix);