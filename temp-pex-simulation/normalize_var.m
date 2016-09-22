 function [normalized] = normalize_var(cell, x, y)
     % Normalize to [0, 1]:
     array = cell2mat(cell);
     m = min(array);
     range = max(array) - m;
     array = (array - m) / range;

     % Then scale to [x,y]:
     range2 = y - x;
     normalized = (array*range2) + x;
     normalized = num2cell(normalized);
end

