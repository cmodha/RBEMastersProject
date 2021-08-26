%Function to take the Binary slices of the computed TDC and count how many
%spots are on it.
function x = spotCounter(BWSlices)
numSims = length(fieldnames(BWSlices));
count = 0;
mdl = 'blobanalysis';
open_system(mdl);
in(1:numSims) = Simulink.SimulationInput(mdl);
rtp = Simulink.BlockDiagram.buildRapidAcceleratorTarget(mdl);
for i = 1:numSims
            in(i) = in(i).setModelParameter('SimulationMode', 'accelerator','SaveTime', 'on', 'SaveOutput', 'on');
            simSlices = BWSlices.(['slice_',num2str(i)]);
            Use setVariable to specify a new value for a variable during
            simulations
            in(i) = in(i).setVariable('ImageValue', simSlices);
end
simOut = parsim(in);
for i=1:numSims
    count = count + simOut(1,i).count;
end

%x = count;
% function x = spotCounter(BWSlices)
% size = length(fieldnames(BWSlices));
% count = 0;
% mdlWks = get_param('blobanalysis','ModelWorkspace');
% for(i=1:size)
%     modelSlice = BWSlices.(['slice_',num2str(i)]);
%     assignin(mdlWks,'modelSlice',modelSlice);
%     simOut = sim('blobanalysis');
%     count = count + simOut.count;
% end
% x = count;
