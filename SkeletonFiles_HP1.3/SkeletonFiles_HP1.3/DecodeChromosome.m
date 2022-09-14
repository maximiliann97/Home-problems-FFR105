function x = DecodeChromosome(chromosome, numberOfVariables, maximumVariableValue)

   % Initializing of variables
   m = length(chromosome);
   n = numberOfVariables;
   k = m/n;
   d = maximumVariableValue;
   x = zeros(1,n);
    

   % Loop over the total number of variables and then over each bit.
   % Smart indexing gives us the correct slice of the chromsome to the
   % corresponding x.
   for i = 1:numberOfVariables
       for j=1:k
           x(j) = x + 2^(-j)*chromosome(j+(1-i)*k);
       end
   end
    
   % As in Eq.9 in the course book
   x = -d + (2*d/(1-2^(-k)))*x;
   

  
   

end