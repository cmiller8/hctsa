%The steps in this file create the analysis for differentiating the
%building use types

%Label the points
TS_subset('raw',TS_getIDs({'Group1','Group2'},'raw'),TS_getIDs('constype','raw','ops'),1,'HCTSA_Group1_vs_Group2.mat')

%Then make the `HCTSA_dorm_prim.mat` into the `HCTSA.mat` file
TS_LabelGroups({'Group1','Group2'},'raw');

%Normalize
TS_normalize('scaledRobustSigmoid',[0.8,1.0]);

%Cluster
distanceMetricRow = 'euclidean'; % time-series feature distance
linkageMethodRow = 'average'; % linkage method
distanceMetricCol = 'corr_fast'; % a (poor) approximation of correlations with NaNs
linkageMethodCol = 'average'; % linkage method

TS_cluster(distanceMetricRow, linkageMethodRow, distanceMetricCol, linkageMethodCol);

%Create a clustered heatmap
TS_plot_DataMatrix('cl','colorGroups',1);

TS_TopFeatures();

TS_plot_pca('norm','ts');
