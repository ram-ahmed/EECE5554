% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 3314.349985947832465 ; 3310.433280028421905 ];

%-- Principal point:
cc = [ 1930.220721875123672 ; 1553.724218497563243 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.084919672063455 ; -0.075680593182902 ; -0.005707759912961 ; 0.017167702962389 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 84.919534461649079 ; 83.331235388166917 ];

%-- Principal point uncertainty:
cc_error = [ 81.489344573577142 ; 96.763151590380218 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.043685242261061 ; 0.123036909582742 ; 0.006351926943175 ; 0.005797140040843 ; 0.000000000000000 ];

%-- Image size:
nx = 4000;
ny = 3000;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 9;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.221634e+00 ; -2.212684e+00 ; 6.959896e-03 ];
Tc_1  = [ -3.241281e-01 ; -5.669051e-01 ; 1.764503e+00 ];
omc_error_1 = [ 2.017548e-02 ; 2.067058e-02 ; 4.216297e-02 ];
Tc_error_1  = [ 4.405205e-02 ; 5.167606e-02 ; 4.637346e-02 ];

%-- Image #2:
omc_2 = [ 1.983115e+00 ; 2.010351e+00 ; -4.185899e-01 ];
Tc_2  = [ -3.281435e-01 ; -6.465967e-01 ; 1.908760e+00 ];
omc_error_2 = [ 1.715818e-02 ; 2.320449e-02 ; 3.587235e-02 ];
Tc_error_2  = [ 4.737780e-02 ; 5.460898e-02 ; 5.231473e-02 ];

%-- Image #3:
omc_3 = [ 1.931284e+00 ; 1.825423e+00 ; -5.819405e-01 ];
Tc_3  = [ -4.633583e-01 ; -6.490691e-01 ; 1.975392e+00 ];
omc_error_3 = [ 1.764123e-02 ; 2.575097e-02 ; 3.399400e-02 ];
Tc_error_3  = [ 4.920632e-02 ; 5.754384e-02 ; 5.116564e-02 ];

%-- Image #4:
omc_4 = [ 1.809227e+00 ; 1.738276e+00 ; -6.334923e-01 ];
Tc_4  = [ -8.003437e-01 ; 9.288532e-02 ; 2.115835e+00 ];
omc_error_4 = [ 1.695657e-02 ; 2.436102e-02 ; 3.161714e-02 ];
Tc_error_4  = [ 5.205819e-02 ; 6.427250e-02 ; 5.415727e-02 ];

%-- Image #5:
omc_5 = [ 1.941837e+00 ; 1.869678e+00 ; -3.816107e-01 ];
Tc_5  = [ -7.928865e-01 ; -3.927055e-01 ; 1.993045e+00 ];
omc_error_5 = [ 1.713791e-02 ; 2.456757e-02 ; 3.511783e-02 ];
Tc_error_5  = [ 4.935579e-02 ; 5.943601e-02 ; 5.450716e-02 ];

%-- Image #6:
omc_6 = [ 1.605134e+00 ; 2.043537e+00 ; -1.315813e+00 ];
Tc_6  = [ -6.253076e-01 ; 3.953271e-02 ; 2.343070e+00 ];
omc_error_6 = [ 1.157324e-02 ; 3.178243e-02 ; 3.376243e-02 ];
Tc_error_6  = [ 5.668906e-02 ; 6.939886e-02 ; 5.067296e-02 ];

%-- Image #7:
omc_7 = [ 1.999649e+00 ; 8.989964e-01 ; -3.732712e-01 ];
Tc_7  = [ -8.823239e-01 ; 3.582662e-01 ; 1.766045e+00 ];
omc_error_7 = [ 2.302365e-02 ; 1.907994e-02 ; 2.644265e-02 ];
Tc_error_7  = [ 4.465166e-02 ; 5.579526e-02 ; 4.992945e-02 ];

%-- Image #8:
omc_8 = [ 1.552518e+00 ; 2.007043e+00 ; -3.744353e-02 ];
Tc_8  = [ -1.054905e-01 ; -7.171201e-01 ; 2.013371e+00 ];
omc_error_8 = [ 2.086281e-02 ; 2.228448e-02 ; 3.017942e-02 ];
Tc_error_8  = [ 5.003866e-02 ; 5.734477e-02 ; 5.716581e-02 ];

%-- Image #9:
omc_9 = [ 2.240173e+00 ; 1.748985e+00 ; -9.768657e-01 ];
Tc_9  = [ -6.665913e-01 ; -4.892445e-01 ; 2.298737e+00 ];
omc_error_9 = [ 1.615834e-02 ; 3.059959e-02 ; 3.835920e-02 ];
Tc_error_9  = [ 5.694994e-02 ; 6.838597e-02 ; 5.402760e-02 ];

