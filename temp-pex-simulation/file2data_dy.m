function [ salida ] = file2data_dy( dataImport, label )
%FILE2DATA Summary of this function goes here
%   Detailed explanation goes here
%generamos el .data

file_data = [dataImport label];

[Fm, Cm] = size(file_data);
dy = cell(1,Cm);
dy{1,1} = 'DY';
num_puntos = cell(1,Cm);
num_puntos{1,1} = Fm;

num_dimension = cell(1,Cm);
num_dimension{1,1} = Cm;

nombre_obj = cell(1,Cm);

for i = 1: Cm
    nombre_obj{1,i} = i;
end 

salida = [dy; num_puntos; num_dimension; nombre_obj; file_data];

[Fm, Cm] = size(salida);

fi = fopen('salida.data', 'w'); 
	
for i = 1:Fm 
    for j = 1:Cm
        if ~isempty(salida{i,j})
            if i == 1          
                fprintf(fi, '%s%s', salida{i,j},';');
            elseif i == 2 || i == 3 || i == 4
                fprintf(fi, '%i%s', salida{i,j},';');
            else
                fprintf(fi, '%f%s', salida{i,j},';');
            end
        end
    end 
    %fprintf(fi, '\b');
    fseek(fi,-1,0); 
    fprintf(fi, '\n');
end

fclose(fi);



end

