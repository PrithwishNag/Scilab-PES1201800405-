//USED FOR FINDING THE TRIANGULAR FACTORS OF A MATRIX WHICH ARE lower:LOWER TRIANGULAR AND upper:UPPER TRIANGULAR

clc;

disp('Enter the coefficient.matrix');

a11=input("Enter a11: ");

a12=input("Enter a12: ");

a13=input("Enter a13: ");

a21=input("Enter a21: ");

a22=input("Enter a22: ");

a23=input("Enter a23: ");

a31=input("Enter a31: ");

a32=input("Enter a32: ");

a33=input("Enter a33: ");



A=[a11,a12,a13;a21,a22,a23;a31,a32,a33];



disp('Enter the matrix of Constants');

b1=input("Enter b1: ");

b2=input("Enter b2: ");

b3=input("Enter b3: ");



b=[b1;b2;b3];  //Constant matrix



for l=1:3

    lower(l,l)=1;

end

for i=1:3

    for j=1:3

        s=0;

        if j>=i

            for k=1:i-1

                s=s+lower(i,k)*upper(k,j);

            end

            upper(i,j)=A(i,j)-s;

        else

            for k=1:j-1

                s=s+lower(i,k)*upper(k,j);

            end

            lower(i,j)=(A(i,j)-s)/upper(j,j);

        end

    end

end



disp('The Upper triangular matrix is :');

disp(upper);

disp('The Lower triangular matrix is :');

disp(lower);

disp('Product LU =' );

disp(lower*upper);

disp('This proves A=LU . Now,');

c=inv(lower)*b;

x=inv(upper)*c;

disp(x,'Solution to the given equations are :');
