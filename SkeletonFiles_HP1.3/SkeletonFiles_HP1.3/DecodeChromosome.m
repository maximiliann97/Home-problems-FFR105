function x = DecodeChromosome(chromosome, numberOfVariables, maximumVariableValue)

   m = length(chromosome);
   n = numberOfVariables;
   k = m/n;
   
   for j = 1:numberOfVariables
       for i=1:k
           x(j) = x(j)+(2^(-i)*chromosome(i+(j-1)*k));
       end
   end
   
   x=x*(2*maximumVariableValue/(1-2^(-k)));
   x = x - maximumVariableValue;
   

end