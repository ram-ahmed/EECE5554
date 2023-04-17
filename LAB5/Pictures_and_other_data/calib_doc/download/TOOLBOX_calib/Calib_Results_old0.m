% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 3330.698681084085365 ; 3328.019502746584294 ];

%-- Principal point:
cc = [ 1942.937877205973336 ; 1521.059855939612135 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ -0.063111155532446 ; -0.101417742744545 ; -0.006977193640665 ; 0.019962986977510 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 3.883263414140911 ; 3.813492030910951 ];

%-- Principal point uncertainty:
cc_error = [ 3.794160593221271 ; 4.349354472516022 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.001984122682240 ; 0.005415967627450 ; 0.000303774555540 ; 0.000280848851780 ; 0.000000000000000 ];

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
omc_1 = [ -2.224331e+00 ; -2.215283e+00 ; 5.715638e-03 ];
Tc_1  = [ -3.314422e-01 ; -5.488769e-01 ; 1.780195e+00 ];
omc_error_1 = [ 9.178952e-04 ; 9.504007e-04 ; 1.936961e-03 ];
Tc_error_1  = [ 2.055043e-03 ; 2.330146e-03 ; 2.095699e-03 ];

%-- Image #2:
omc_2 = [ 1.976461e+00 ; 2.002781e+00 ; -4.201640e-01 ];
Tc_2  = [ -3.358891e-01 ; -6.281307e-01 ; 1.925920e+00 ];
omc_error_2 = [ 7.694119e-04 ; 1.052303e-03 ; 1.621983e-03 ];
Tc_error_2  = [ 2.207051e-03 ; 2.468103e-03 ; 2.360971e-03 ];

%-- Image #3:
omc_3 = [ 1.922227e+00 ; 1.814796e+00 ; -5.832629e-01 ];
Tc_3  = [ -4.716922e-01 ; -6.288580e-01 ; 1.988029e+00 ];
omc_error_3 = [ 7.887652e-04 ; 1.171736e-03 ; 1.527818e-03 ];
Tc_error_3  = [ 2.285457e-03 ; 2.595576e-03 ; 2.295191e-03 ];

%-- Image #4:
omc_4 = [ 1.807092e+00 ; 1.731525e+00 ; -6.431468e-01 ];
Tc_4  = [ -8.098549e-01 ; 1.163426e-01 ; 2.130547e+00 ];
omc_error_4 = [ 7.578209e-04 ; 1.118334e-03 ; 1.431629e-03 ];
Tc_error_4  = [ 2.429906e-03 ; 2.904860e-03 ; 2.452045e-03 ];

%-- Image #5:
omc_5 = [ 1.938675e+00 ; 1.864013e+00 ; -3.906971e-01 ];
Tc_5  = [ -8.014143e-01 ; -3.713124e-01 ; 2.008763e+00 ];
omc_error_5 = [ 7.679429e-04 ; 1.123742e-03 ; 1.593087e-03 ];
Tc_error_5  = [ 2.301908e-03 ; 2.688884e-03 ; 2.459493e-03 ];

%-- Image #6:
omc_6 = [ 1.601007e+00 ; 2.030584e+00 ; -1.326976e+00 ];
Tc_6  = [ -6.326288e-01 ; 6.524123e-02 ; 2.353256e+00 ];
omc_error_6 = [ 5.230728e-04 ; 1.447281e-03 ; 1.515931e-03 ];
Tc_error_6  = [ 2.634892e-03 ; 3.121443e-03 ; 2.287127e-03 ];

%-- Image #7:
omc_7 = [ 1.993868e+00 ; 8.943723e-01 ; -3.765490e-01 ];
Tc_7  = [ -8.913077e-01 ; 3.778274e-01 ; 1.776307e+00 ];
omc_error_7 = [ 1.023414e-03 ; 8.803324e-04 ; 1.203498e-03 ];
Tc_error_7  = [ 2.085490e-03 ; 2.522850e-03 ; 2.272062e-03 ];

%-- Image #8:
omc_8 = [ 1.541474e+00 ; 1.999303e+00 ; -4.327993e-02 ];
Tc_8  = [ -1.123727e-01 ; -6.971549e-01 ; 2.031515e+00 ];
omc_error_8 = [ 9.305190e-04 ; 1.015870e-03 ; 1.356756e-03 ];
Tc_error_8  = [ 2.331658e-03 ; 2.585981e-03 ; 2.584558e-03 ];

%-- Image #9:
omc_9 = [ 2.232849e+00 ; 1.736323e+00 ; -9.816696e-01 ];
Tc_9  = [ -6.747491e-01 ; -4.644101e-01 ; 2.310986e+00 ];
omc_error_9 = [ 7.327536e-04 ; 1.389872e-03 ; 1.723878e-03 ];
Tc_error_9  = [ 2.641235e-03 ; 3.081628e-03 ; 2.425553e-03 ];

