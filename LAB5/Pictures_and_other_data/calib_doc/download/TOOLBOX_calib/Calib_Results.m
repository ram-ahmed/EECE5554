% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 3313.199092027215102 ; 3320.062530137804060 ];

%-- Principal point:
cc = [ 1925.321392013198192 ; 1551.829932473993267 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.077151675821233 ; -0.076023371300785 ; -0.008450226135605 ; 0.018312089023742 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 9.229412580097005 ; 9.133632059651910 ];

%-- Principal point uncertainty:
cc_error = [ 8.971474869728821 ; 10.457430681950855 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.004745663698910 ; 0.013373920021894 ; 0.000699479484979 ; 0.000643438147590 ; 0.000000000000000 ];

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
omc_1 = [ -2.224127e+00 ; -2.214464e+00 ; 1.254674e-02 ];
Tc_1  = [ -3.219041e-01 ; -5.650755e-01 ; 1.772913e+00 ];
omc_error_1 = [ 2.166357e-03 ; 2.223205e-03 ; 4.582058e-03 ];
Tc_error_1  = [ 4.869071e-03 ; 5.589063e-03 ; 5.035359e-03 ];

%-- Image #2:
omc_2 = [ 1.978100e+00 ; 2.006429e+00 ; -4.219520e-01 ];
Tc_2  = [ -3.256874e-01 ; -6.439567e-01 ; 1.916197e+00 ];
omc_error_2 = [ 1.832793e-03 ; 2.489215e-03 ; 3.880801e-03 ];
Tc_error_2  = [ 5.227551e-03 ; 5.904927e-03 ; 5.672252e-03 ];

%-- Image #3:
omc_3 = [ 1.926380e+00 ; 1.822351e+00 ; -5.817981e-01 ];
Tc_3  = [ -4.607470e-01 ; -6.468764e-01 ; 1.983488e+00 ];
omc_error_3 = [ 1.895006e-03 ; 2.769667e-03 ; 3.686491e-03 ];
Tc_error_3  = [ 5.428515e-03 ; 6.223034e-03 ; 5.554095e-03 ];

%-- Image #4:
omc_4 = [ 1.811001e+00 ; 1.737543e+00 ; -6.391663e-01 ];
Tc_4  = [ -7.985462e-01 ; 9.564059e-02 ; 2.120574e+00 ];
omc_error_4 = [ 1.815421e-03 ; 2.635568e-03 ; 3.442407e-03 ];
Tc_error_4  = [ 5.747112e-03 ; 6.948474e-03 ; 5.884560e-03 ];

%-- Image #5:
omc_5 = [ 1.940962e+00 ; 1.867680e+00 ; -3.928224e-01 ];
Tc_5  = [ -7.908572e-01 ; -3.887609e-01 ; 2.000746e+00 ];
omc_error_5 = [ 1.826085e-03 ; 2.650734e-03 ; 3.807723e-03 ];
Tc_error_5  = [ 5.451230e-03 ; 6.431198e-03 ; 5.916578e-03 ];

%-- Image #6:
omc_6 = [ 1.602908e+00 ; 2.040791e+00 ; -1.323616e+00 ];
Tc_6  = [ -6.212798e-01 ; 4.327686e-02 ; 2.344495e+00 ];
omc_error_6 = [ 1.259692e-03 ; 3.435547e-03 ; 3.682678e-03 ];
Tc_error_6  = [ 6.244685e-03 ; 7.485654e-03 ; 5.490595e-03 ];

%-- Image #7:
omc_7 = [ 2.001849e+00 ; 9.004650e-01 ; -3.784532e-01 ];
Tc_7  = [ -8.811726e-01 ; 3.608184e-01 ; 1.770152e+00 ];
omc_error_7 = [ 2.469752e-03 ; 2.077751e-03 ; 2.892488e-03 ];
Tc_error_7  = [ 4.933867e-03 ; 6.036017e-03 ; 5.429312e-03 ];

%-- Image #8:
omc_8 = [ 1.549635e+00 ; 2.005649e+00 ; -4.436195e-02 ];
Tc_8  = [ -1.018386e-01 ; -7.149461e-01 ; 2.026999e+00 ];
omc_error_8 = [ 2.226554e-03 ; 2.404522e-03 ; 3.285752e-03 ];
Tc_error_8  = [ 5.539126e-03 ; 6.214602e-03 ; 6.208157e-03 ];

%-- Image #9:
omc_9 = [ 2.233958e+00 ; 1.744996e+00 ; -9.809846e-01 ];
Tc_9  = [ -6.630656e-01 ; -4.853510e-01 ; 2.304051e+00 ];
omc_error_9 = [ 1.748831e-03 ; 3.302018e-03 ; 4.172762e-03 ];
Tc_error_9  = [ 6.268366e-03 ; 7.389160e-03 ; 5.854332e-03 ];

