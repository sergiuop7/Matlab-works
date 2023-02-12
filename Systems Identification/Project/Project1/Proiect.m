clear variables
clc
close all

% Load project data
project_data = load ('product_1.mat'); 
time = project_data.time;
y = project_data.y;

% 80% of project dataset is identification, 20% is validation.
y_id = y(1:87); 
y_val = y(88:109);
time_id = time(1:87);
time_val = time(88:109);

P = 12; % 12 by default (see project document)

m = 7

phi_transposed_matrix_id = zeros(length(time_id), 2 + 2 * m);

%   Building the phi transposed matrix for the identification data
for i = 1 : length(time_id)
    phi_transposed_matrix_id(i, 1) = 1;
    phi_transposed_matrix_id(i, 2) = time_id(i);
    for j = 3 : 2 : (2 * m + 1)
        phi_transposed_matrix_id(i, j) = cos(pi * (j-1) * time_id(i) / P);
        phi_transposed_matrix_id(i, j + 1) = sin(pi * (j-1) * time_id(i) / P);
    end
end

theta = phi_transposed_matrix_id \ y_id;

%   Calculating the aporiximated output
y_approximated_id = phi_transposed_matrix_id * theta;

%   Calculating the Mean Square Error for the identification data
err_squared_id = (y_id - y_approximated_id) .^ 2;
MSE_id = (1 / length(time_id)) * sum(err_squared_id);


%   Validating the data

phi_transposed_matrix_val = zeros(length(time_val), 2 + 2 * m);

%   Building the phi transposed matrix for the validation data
for i = 1 : length(time_val)
    phi_transposed_matrix_val(i, 1) = 1;
    phi_transposed_matrix_val(i, 2) = time_val(i);
    for j = 3 : 2 : (2 * m + 1)
        phi_transposed_matrix_val(i, j) = cos(pi * (j-1) * time_val(i) / P);
        phi_transposed_matrix_val(i, j + 1) = sin(pi * (j-1) * time_val(i) / P);
    end
end

%   Calculating the aporiximated output
y_approximated_val = phi_transposed_matrix_val * theta;

%   Calculating the Mean Square Error for the validation data
err_squared_val = (y_val - y_approximated_val) .^ 2;
MSE_val = (1 / length(time_val)) * sum(err_squared_val);



%   Plotting the approximated output for the identification data
figure,
plot(time_id, y_id, time_id, y_approximated_id);
title("Approximation for the identification data " + newline + "MSE = " + MSE_id),
xlabel("Time");
ylabel("Y id");
legend("Identification Data", "Approximated Data");

%   Plotting the approximated output for the valiation data
figure,
plot(time_val, y_val, time_val, y_approximated_val)
title("Approximation for the validation data"  + newline + "MSE = " + MSE_val),
xlabel("Time");
ylabel("Y val");
legend("Validation Data", "Approximated Data");

%   Plotting the MSEs as functions of m
figure,
plot(error_id)
title('MSE for identification values depending on m')
xlabel('m')
ylabel('Error values')

figure,
plot(error_val)
title('MSE for validation values depending on m')
xlabel('m')
ylabel('Error values')


