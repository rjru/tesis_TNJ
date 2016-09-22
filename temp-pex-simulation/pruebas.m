
if isempty(aaa{1,1})
disp('vacio')
else
disp('llenooo')
end



% A = rand(20, 5);
% fi = fopen('salida.txt', 'w'); 
% 	
% for i = 1:20 
%     for j = 1:5 
%         fprintf(fi, '%f%s', A(i,j),' ');
%     end 
%     fprintf(fi, '\n'); 
% end
% 
% fclose(fi);



%seqs = fastaread('pf00002.fa');

%distances = seqpdist(seqs,'method','jukes-cantor','indels','pair');

%phylotree = seqneighjoin(distances,'equivar',seqs)

%view(phylotree)

%dataImport = importfile('synthetic_control_TRAIN',1,300);
%[F, C] = size(dataImport);
% vector1 = dataImport(3,1:C);
% vector2 = dataImport(4,1:C);

% vector1 = cell2mat(vector1);
% vector2 = cell2mat(vector2);
% d1 = dtw(vector1,vector2);