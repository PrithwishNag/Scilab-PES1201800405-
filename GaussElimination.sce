//USED FOR FINDING THE SOLUTIONS OF A SYSTEM OF LINEAR EQUATIONS BY CONSIDERING THEM IN THE MATRIX FORM

clc;

disp('Enter the coefficient matrix');



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



b=[b1;b2;b3];

Aug=[A b];

Aug_A=Aug;



disp('The Augmented Matrix is ');

disp(Aug);

n=3; //The value of n can be set to any value depending on the n x n matrix needed



disp('The states of the Matrix is');



for i=2:n

    for j=2:n+1

        Aug_A(i,j)=Aug_A(i,j)-Aug_A(1,j)*Aug_A(i,1)/Aug_A(1,1);

    end

    Aug_A(i,1)=0;

end



disp(Aug_A);

for i=3:n

    for j=3:n+1

        Aug_A(i,j)=Aug_A(i,j)-Aug_A(2,j)*Aug_A(i,2)/Aug_A(2,2);

    end

    Aug_A(i,2)=0;

end

disp(Aug_A)

x(n)=Aug_A(n,n+1)/Aug_A(n,n);

for i=n-1:-1:1

    sumk=0;

    for k=i+1:n

        sumk=sumk+Aug_A(i,k)*x(k);

    end

    x(i)=(Aug_A(i,n+1)-sumk)/Aug_A(i,i);

end

disp(x(3),x(2),x(1),'The values of x ,y , z are :');

disp(Aug_A(1,1),Aug_A(2,2),Aug_A(3,3), 'The pivots are ');
