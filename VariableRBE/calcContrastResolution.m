%find the lowerst contrast difference between two adjacent voxels. This is
%taken to be the contrast resolution.

a=0;
b=0;
minContrast = 1000;
dim = ct.cubeDim;
N = dim(1)*dim(2)*dim(3);%number of voxels in ct image
for i = 1:(N-1)
    a = ct.cubeHU{1,1}(i);
    b = ct.cubeHU{1,1}(i+1);
    contrast = abs(a-b);
    if contrast ~=0  
      minContrast = min(contrast,minContrast);
    end
end