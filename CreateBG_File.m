%The steps in this file help to setup the Building Genome (BG) features

%Initialize the empty data containers
TS_init('INP_buildinggenome.txt','INP_allbg_mops.txt','INP_allbg_ops.txt');

%Load the 'calculated' values from the feature creation process

resultsdummy = csvread('ALLFEATURES.txt')
qualitydummy = csvread('TS_QualityDummy.txt')

% At this point, these matrices have to be copied into the empty data
% frames set up by the INIT_ts process


