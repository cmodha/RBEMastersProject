%load HEAD_AND_NECK
%load TG119.mat
%load PROSTATE.mat
%load LIVER.mat
%load BOXPHANTOM.mat
addpath 'matRad'
% matRadGUI
load phantoms\ALDERSON2.mat;

% meta information for treatment plan
pln.radiationMode   = 'protons';     % either photons / protons / carbon
pln.machine         = 'Generic';
pln.numOfFractions  = 30;
ct.tissueTolerance=ct.tissueTolerance/pln.numOfFractions;

% beam geometry settings
pln.propStf.bixelWidth      = 5; % [mm] / also corresponds to lateral spot spacing for particles
pln.propStf.gantryAngles    = [85 175]; % [60 120 -60 -120] [85, 175] [300 270] [70 70]
pln.propStf.couchAngles     = [0 0]; % [0 0 0 0] [0 0] [80 0] [300 0]
% pln.propStf.gantryAngles    = [60 -60 120 -120]; % [60 120 -60 -120] [85, 175] [300 270] [70 70]
% pln.propStf.couchAngles     = [0 0 0 0]; % [0 0 0 0] [0 0] [80 0] [300 0]
pln.propStf.numOfBeams      = numel(pln.propStf.gantryAngles);
pln.propStf.isoCenter       = ones(pln.propStf.numOfBeams,1) * matRad_getIsoCenter(cst,ct,0);

% dose calculation settings
pln.propDoseCalc.doseGrid.resolution.x = 5; % [mm]
pln.propDoseCalc.doseGrid.resolution.y = 5; % [mm]
pln.propDoseCalc.doseGrid.resolution.z = 5; % [mm]
pln.propDoseCalc.calcLET = 1;

% optimization settings
pln.propOpt.optimizer       = 'IPOPT';
pln.propOpt.bioOptimization = 'const_RBExD';% const_RBExD; constant RBE of 1.1;
      
pln.propOpt.runDAO          = false;  % 1/true: run DAO, 0/false: don't / will be ignored for particles
pln.propOpt.runSequencing   = false;  % 1/true: run sequencing, 0/false: don't / will be ignored for particles and also triggered by runDAO below

%Load default HLUT
hlutDir = fullfile(fileparts(mfilename('fullpath')),'hlutLibrary',filesep);
hlutFileName = strcat(hlutDir,'matRad_default.hlut');

%Calculate and Optimise
stf = matRad_generateStf(ct, cst, pln);
dij = matRad_calcParticleDose(ct, stf, pln, cst);
resultGUI = matRad_fluenceOptimization(dij,cst,pln);

%Calculate graphs
postOptimiser;