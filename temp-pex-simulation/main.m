
dataImport = importfile('FaceFour_TEST',1,88);
dataImport2 = importfile('FaceFour_TRAIN',1,24);

dataImport = [dataImport; dataImport2]; % data completa

% generamos los escalares
scalar = generate_dot_scalar(dataImport);

label = dataImport(:,1);
dataImport(:,1) = [];

% [Fm, Cm] = size(dataImport);
% %normalizamos
% for i = 1: Fm
%     dataImport(i,:) = normalize_var(dataImport(i,:),0,1);
% end 
% %fin de normalización


filedata = file2data_dy(dataImport,label); % generamos el .data mas adelante generamos las distancias
%% 

[F, C] = size(dataImport);

%vector1 = dataImport(1,1:C);
%vector2 = dataImport(2,1:C);

%asd = cos(2*pi*(3*(1:1000)/1000).^2);
%vector1 = cell2mat(vector1);
%vector2 = cell2mat(vector2);
%d1 = dtw(vector1,vector2);

Matrix_dis = cell(F);
%Matrix_dis{1,1} = 4;
for i = 1: F
    for j = 1: F
        if i ~= j && i > j
            vector1 = dataImport(i,1:C);
            vector2 = dataImport(j,1:C);
        
            Matrix_dis{i,j} = dtw(cell2mat(vector1),cell2mat(vector2));
            %Matrix_dis{i,j} = pdist2(cell2mat(vector1),cell2mat(vector2));
        end
    end 
end 

matrix_dis_pex = matrix_dis2pex(Matrix_dis);



