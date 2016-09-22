function [ matrix_dist_pex ] = matrix_dis2pex( matrix_dis )

[Fm, Cm] = size(matrix_dis);
%linea es el numero de columnas
num_de_col = cell(1,Fm);
num_de_col{1,1} = Fm;
%numeración de objetos 
%llenar una fila de ceros
nombre_obj = cell(1,Fm);
fila_ceros = cell(1,Fm);

for i = 1: Fm
    nombre_obj{1,i} = i;
    fila_ceros{1,i} = 0;
end 

cabecera = [num_de_col; nombre_obj; fila_ceros];
matrix_dist_pex = [cabecera; matrix_dis];
%eliminamos una fila que esta de residuo
matrix_dist_pex(4,:) = [];

%GUARDAMOS LA DATA EN UN ARCHIVO TXT.
[Fm, Cm] = size(matrix_dist_pex);

fi = fopen('salida.dmat', 'w'); 
	
for i = 1:Fm 
    for j = 1:Cm
        if ~isempty(matrix_dist_pex{i,j})
            if i == 1 || i == 2 || i == 3
                % en el caso que sean las tres primeras filas .. deben solo
                % ser enteros                
                fprintf(fi, '%i%s', matrix_dist_pex{i,j},';');
            else
                fprintf(fi, '%f%s', matrix_dist_pex{i,j},';');
            end
        end
    end 
    %fprintf(fi, '\b');
    fseek(fi,-1,0); 
    fprintf(fi, '\n');
end

fclose(fi);


end

