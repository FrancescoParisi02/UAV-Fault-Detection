%start
clear all %clear all variables
clc %clear window

folderPath = 'dataset';  % Adatta questo percorso alla tua cartella

% Ottieni una lista di tutti i file .mat nella cartella
filelist = dir(fullfile(folderPath, '*.mat'));
filelist = {filelist.name};

% Faults
noFault = startsWith(filelist, 'NO');
fault_5 = endsWith(filelist, '5.mat');
fault_10 = endsWith(filelist, '10.mat');

% Priorità
priority(fault_5) = 2; % Default priority (middle)
priority(noFault) = 1;   % Highest priority
priority(fault_10) = 3; % Lowest priority

% Ordine in base al fault
[~, sortIdx] = sort(priority);
filelist = filelist(sortIdx);

% Conta il numero di file
nFiles = length(filelist);

%synch meth
%synch_meth = "zoh";  % Puoi mantenere la tua variabile synch_meth se ti serve
Hz = 350;
datalist = cell(1, nFiles);

% Elenco e sincronizzazione dei dati
for i = 1:nFiles
    datalist{i} = sync(fullfile(folderPath, filelist{i}), Hz);  % Carica i file dinamicamente
end

%datatable
dataTable = datatable(datalist, nFiles, Hz);

%% Definition of the fault codes
fault_multi = [0 0 0 0 0 0 5 5 5 5 5 5 10 10 10 10 10 10];
fault_binary = [0 0 0 0 0 0 1 1 1 1 1 1 1 1 1 1 1 1];
fault_motor = [0 0 0 0 0 0 1 2 3 4 5 6 1 2 3 4 5 6];
fault_cat_multi = categorical(fault_multi');
fault_cat_binary = categorical(fault_binary');
fault_cat_motor = categorical(fault_motor');
dataTable.faultCode_multi(:) = fault_cat_multi;
dataTable.faultCode_binary(:) = fault_cat_binary;
dataTable.faultCode_motor(:) = fault_cat_motor;

fprintf("Creazione delle feature in corso...")

%% Computation of Diagnostic Feature Designer features
[feature_Table,data_feature_Table] = diagnosticFeaturesFinal(dataTable);

fprintf("Pulizia delle feature...")

%% Clean features by removing NaNs from features
feature_Table=standardizeMissing(feature_Table,{-Inf,Inf});
countcolumnNaNs=[zeros(1,4),sum(isnan(table2array(feature_Table(:,5:end))))];
% Remove features with more than 25% of NaNs
feature_Table(:,find(countcolumnNaNs>size(feature_Table,1)/4))=[];
% First sample: if a feature sample is NaN, replace with 0
initial=find(feature_Table.('FRM_1/TimeStart')==0);
feature_Table_tmp1 = fillmissing(feature_Table(initial,:),'constant',0,'DataVariables',@isnumeric);
feature_Table(initial,:) = feature_Table_tmp1;
% Second to last sample: if a feature sample is NaN, replace with previous value
feature_Table = fillmissing(feature_Table,'previous');

%% Split into training and testing data
rng(0)
partition=cvpartition(feature_Table.EnsembleID_,'Holdout',0.3,'Stratify',true);
idx_train = training(partition);
idx_test = test(partition);

feature_Table_Train=feature_Table(idx_train,:);
feature_Table_Test=feature_Table(idx_test,:);

%% Save data and try to reload the feature table
save data_feature_Table_zoh.mat dataTable data_feature_Table feature_Table feature_Table_Train feature_Table_Test
clear all
load data_feature_Table_zoh.mat

%%

% fprintf("Passaggio della tabella di traning al classificatore...")
% 
% classificationLearner(feature_Table_Train,'faultCode');

