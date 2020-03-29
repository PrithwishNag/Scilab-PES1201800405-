function columnspan(mat,n)
    disp("Column Span:");
    for x=1:n-1
        for y=x+1:n
            mat(y,:) = mat(y,:) - (mat(y,x)/mat(x,x)) * mat(x,:);
        end
        disp(mat);
    end
    for x=1:n
        if(mat(x,x)<>0)
            mat(x,:)=mat(x,:)/mat(x,x);
        end
    end
    disp(mat);
    for x=1:n
        for y=x:n
            if(mat(x,y)<>0)
                disp('is a pivot element ',y,'column');
                break;
            end;
        end;
    end;
endfunction

function fundamental_sub_spaces(mat)
    disp("Fundamental Spaces:");
    [m,n] = size(mat);
    disp(m,'m is ');
    disp(n,'n is ');
    [v,pivot] = rref(mat);
    disp(rref(mat));
    disp(v);
    rank = length(pivot);
    disp(rank,'rank is ')
    colspace = mat(:,pivot);
    disp(colspace,'Column Space is ');
    nullspace = kernel(mat);
    disp(nullspace,'Null Space is ');
    rs = v(1:rank,:)';
    disp(rs,'Row Space is ')
    leftnullspace = kernel(mat');
    disp(leftnullspace,'Left Null Space is ');
endfunction

inpmatrix = x_matrix("Enter matrix:",zeros(3,3));
disp(inpmatrix,"Input matrix = ");
columnspan(inpmatrix,3);
fundamental_sub_spaces(inpmatrix);