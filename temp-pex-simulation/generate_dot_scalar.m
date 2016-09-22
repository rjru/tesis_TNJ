function [salida] = generate_dot_scalar( matrix_dis )
%GENERATE_DOT_SCALAR Summary of this function goes here
%   Detailed explanation goes here
[F, C] = size(matrix_dis);
scalarf = cell(F,3);

    for i = 1: F
        scalarf{i,1} = i;
        scalarf{i,2} = matrix_dis{i,1};
        scalarf{i,3} = 1;
    end

cabecera = cell(1,3);
cabecera{1,1} = 'cdata';
cabecera{1,2} = 'N_J';

scalarf = [cabecera; scalarf];
[F, C] = size(scalarf);

fi = fopen('salida.scalar', 'w');
for i = 1: F
    if i == 1
        fprintf(fi, '%s%s%s', scalarf{i,1},';', scalarf{i,2});
    else
        fprintf(fi, '%i%s%i%s%i', scalarf{i,1},';', scalarf{i,2},';', scalarf{i,3});
    end
   % fseek(fi,-1,0); 
    fprintf(fi, '\n');
end


salida = scalarf;
end

