function [closest, error] = closestVal(val, toneVals)
   vals = size(toneVals);
   closest = toneVals(1);
   error = Inf;
   for i = 1:vals
       currentError = abs(toneVals(i) - val);
       if currentError < error
           error = val - toneVals(i);
           closest = toneVals(i);
       end
   end
end