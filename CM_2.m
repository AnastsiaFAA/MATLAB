clear all
A = [8 3 2 -1;3 7 -1 -2; 2 -1 10 2; -1 -2 2 10];
b = [5;4;-5;7]; 
n=4;
C= A'*A;
d= A'*b;
U(1,1)=sqrt(C(1,1));
for j = 2 : n
    U(1,j)=C(1,j)/U(1,1);
end
for i = 2 : n
    s=0;
        for k = 1 : i-1
            s = s + U(k,i)^2;
        end
        U(i,i)=sqrt(C(i,i)-s);
            for j = i+1:n
                sum=0;
                for k = 1 : i-1
                    sum = sum + U(k,i)*U(k,j);
                end
                U(i,j)=(1/U(i,i))*(C(i,j)-sum);
            end 
end                        
U            
chol(C)     
y = ((U')^(-1))*d
x= U^(-1)*y
r= A*x-b
norm1=norm(r,1)
norm1=norm(r,2)
norm_inf=norm(r,inf)