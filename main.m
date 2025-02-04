%start
clear all %clear all variables
clc %clear window

%Dataset
filelist=["NO_FAULT1.mat","NO_FAULT2.mat","NO_FAULT3.mat","NO_FAULT4.mat","NO_FAULT5.mat","NO_FAULT6.mat",...
    "FAULT_M1_5.mat","FAULT_M2_5.mat","FAULT_M3_5.mat","FAULT_M4_5.mat","FAULT_M5_5.mat","FAULT_M6_5.mat",...
    "FAULT_M1_10.mat","FAULT_M2_10.mat","FAULT_M3_10.mat","FAULT_M4_10.mat","FAULT_M5_10.mat","FAULT_M6_10.mat"];
nFiles=length(filelist);


