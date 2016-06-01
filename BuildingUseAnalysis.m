%The steps in this file create the analysis for differentiating the
%building use types

%Get the subsets from the main files
TS_subset('raw',TS_getIDs({'UnivDorm','UnivLab'},'raw'),TS_getIDs('usetype','raw','ops'),1,'HCTSA_BG_univdorm_univlab.mat')


TS_subset('raw',TS_getIDs({'UnivDorm','UnivLab'},'raw'),[],1,'HCTSA_Benchmark_univdorm_univlab.mat')
TS_subset('raw',TS_getIDs({'PrimClass','UnivClass'},'raw'),[],1,'HCTSA_Benchmark_univclass_primclass.mat')
TS_subset('raw',TS_getIDs({'Office','UnivLab'},'raw'),[],1,'HCTSA_Benchmark_office_univlab.mat')


%Then make the `HCTSA_dorm_prim.mat` into the `HCTSA.mat` file
TS_LabelGroups({'UnivDorm','UnivLab'},'raw');

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
