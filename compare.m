% function [in1, in2] = compare(in1, in2)
% raw=find(~ismember(in1(:,2),in2(:,2))); %second column is timestamp
% in1(raw,:)=[];
% raw=find(~ismember(in2(:,2),in1(:,2)));
% in2(raw,:)=[];
% if(~(isequal(in1(:,2),in2(:,2))))
%     error("Inputs to be averaged do not share the same timestamps.")
% end
% end

function [in1, in2] = compare(in1, in2)
    % Crea un array logico che indica se ogni timestamp in in1 è presente in in2
    idx_in1 = ismember(in1(:, 2), in2(:, 2));
    
    % Rimuove le righe in in1 che non hanno un corrispondente timestamp in in2
    in1 = in1(idx_in1, :);
    
    % Crea un array logico che indica se ogni timestamp in in2 è presente in in1
    idx_in2 = ismember(in2(:, 2), in1(:, 2));
    
    % Rimuove le righe in in2 che non hanno un corrispondente timestamp in in1
    in2 = in2(idx_in2, :);
    
    % Verifica che i timestamp nelle colonne 2 siano uguali
    if ~isequal(in1(:, 2), in2(:, 2))
        error("Inputs to be averaged do not share the same timestamps.");
    end
end
