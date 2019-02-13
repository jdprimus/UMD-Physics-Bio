function A = lu_gauss(A)
% function uses Gaussian elimination to return 
% a row reduced form of matrix A
  [n,m] = size(A);            % checks the number of rows and columns of A
  if n ~= m; error('A is not a square matrix');  else  % ensures A is square
  for k = 1:n-1
    for i = k+1:n
      A(i,k) = A(i,k)/A(k,k);
      if A(k,k) == 0, error('Null diagonal element'); end
        for j = k+1:n
          A(i,j) = A(i,j) - A(i,k)*A(k,j);
        end
    end
  end
  end
end
