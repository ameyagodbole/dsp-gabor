%% External driver script
DEBUG = 1;
% limits of search space
%       mu_x, mu_y, sigma_x, sigma_y, fx, fy, theta, phase
sMin = [  -2,   -2,       1,       1,0.1,0.1,     0,    0]';
sMax = [   2,    2,      21,      21, 10, 10,    pi,   pi]';
radius=[0.05, 0.05,     0.5,     0.5,0.1,0.1,   0.3,  0.3]';
population_size = 15;

nRRI=20;
nRLC=10;
maxItr=5;
files = {'D94.gif', 'D96.gif'};
num_gabor = 1;

if DEBUG
    disp('main: Calling stochasticSearch with params:')
    sMin,sMax,population_size,radius,nRRI,nRLC,maxItr,files    
end

%Run a check to see hat all the images have the same sizes. The size of the
%first image is taken as a reference.
reference_image_size = size(imread(char(files(1))));
for file_number = 1:size(files,1)
    if(reference_image_size ~= size(imread(char(files(file_number)))))
        print('ERROR! ' + 'Image ' + file_number + '"s size doesn"t match the size of the first image');
        return
    end
end

    
    

joint_best_pop = stochasticSearch( sMin,sMax,population_size,radius,nRRI,nRLC,maxItr,files );
filename = sprintf('population_variation_%s.mat',datestr(clock,'dd_HH_MM_SS'));
save(filename);
