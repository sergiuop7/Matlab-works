clear variables
clc
close all

load("iddata-10.mat");

id_u = id.InputData;
id_y = id.OutputData;
val_u = val.InputData;
val_y = val.OutputData;

figure, plot(id_u);
title("Identification input");
figure, plot(id_y);
title("Identification output");
figure, plot(val_u);
title("Validation input");
figure, plot(val_y);
title("Validation output");

m = input('Enter the degree of the polynomial (1 to 3): ');
na = input('Enter order na (1 to 5): ');
nb = na;
%nk is always equal to 1 therefore it was ignored

if(m == 1)

    %prediction

    %identification
    N = length(id_y);
    phi = zeros(N, nb + na);
    for i = 1 : N
        for j = 1 : na
            if(i - j <= 0)
                phi(i, j) = 0;
            else
                phi(i, j) = -1 * id_y(i - j);
            end
        end
        for j = (na + 1) : (nb + na)
            if(i - j + na <= 0)
                phi(i, j) = 0;
            else
                phi(i, j) = id_u(i - j + na);
            end
        end
    end
    theta = phi \ id_y;
    id_y_approx = phi * theta;
    t = 1 : N;
    for i = 1 : N
    mse(i) = (id_y(i) - id_y_approx(i))^2;
    end
    MSE_pred_id = 1 / N * sum(mse);
    figure, 
    axis([0, 2000, -0.15, 0.15]);
    subplot(211)
    plot(id_y);
    legend("Identification Actual Data");
    title("Prediction identification, m = " + m + ", na = nb = " + na + ", MSE = " + MSE_pred_id);
    subplot(212)
    plot(id_y_approx, 'r'); 
    legend("Identification Prediction Data");

    %validation
    phi_val = zeros(N, nb + na);
    for i = 1 : N
        for j = 1 : na
            if(i - j <= 0)
                phi_val(i, j) = 0;
            else
                phi_val(i, j) = -1 * val_y(i - j);
            end
        end
        for j = (na + 1) : (nb + na)
            if(i - j + na <= 0)
                phi_val(i, j) = 0;
            else
                phi_val(i, j) = val_u(i - j + na);
            end
        end
    end
    val_y_approx = phi_val * theta;
    for i = 1 : N
    mse(i) = (val_y(i) - val_y_approx(i))^2;
    end
    MSE_pred_val = 1 / N * sum(mse);
    figure, 
    axis([0, 2000, -0.15, 0.15]);
    subplot(211)
    plot(val_y);
    legend("Validation Actual Data"); 
    title("Prediction validation, m = " + m + ", na = nb = " + na + ", MSE = " + MSE_pred_val);
    subplot(212)
    plot(val_y_approx, 'r');
    legend("Validation Prediction Data");

    %simulation

    %identification
    phi_sim_id = zeros(length(id_u), nb + na);
    id_y_simulated = zeros(length(id_u), 1);
    for mm = 2 : length(id_u)
        for i = 1 : na
            if(mm - i > 0)
                phi_sim_id(mm, i) = -1 * id_y_simulated(mm - i);
            end
        end
        for j = na + 1 : na + nb
            if((na + mm - j) > 0)
                phi_sim_id(mm, j) = id_u(mm - j + na);
            end
        end
        id_y_simulated(mm) = phi_sim_id(mm, :) * theta;
    end
    for i = 1 : N
    mse(i) = (id_y_simulated(i) - id_y(i))^2;
    end
    MSE_sim_id = 1 / N * sum(mse);
    figure, plot((1:length(id_u)), id_y, 'b', (1:length(id_u)), id_y_simulated, 'r');
    title("Simulation identification, m = 1, na = nb = " + na + ", MSE = " + MSE_sim_id);
    axis([0, 2000, -0.15, 0.15]);

    %validation
    phi_sim_val = zeros(length(val_u), nb + na);
    val_y_simulated = zeros(length(val_u), 1);
    for mm = 2 : length(val_u)
        for i = 1 : na
            if(mm - i > 0)
                phi_sim_val(mm, i) = -1 * val_y_simulated(mm - i);
            end
        end
        for j = na + 1 : na + nb
            if((na + mm - j) > 0)
                phi_sim_val(mm, j) = val_u(mm - j + na);
            end
        end
        val_y_simulated(mm) = phi_sim_val(mm, :) * theta;
    end
    for i = 1 : N
    mse(i) = (val_y_simulated(i) - val_y(i))^2;
    end
    MSE_sim_val = 1 / N * sum(mse);
    figure, plot((1:length(val_u)), val_y, 'b', (1:length(val_u)), val_y_simulated, 'r');
    title("Simulation validation, m = 1, na = nb = " + na + ", MSE = " + MSE_sim_val);
    axis([0, 2000, -0.15, 0.15]);

else

        %prediction

        %identification
        phi = [];
        phi = arx_funct(m, na, nb, id_u, id_y);
        no_of_columns_of_phi = size(phi, 2);
        theta = phi \ id_y;
        y_hat_pred = phi * theta;
        squared_error = (y_hat_pred - id_y) .^ 2;
        MSE_pred_id = sum(squared_error) / length(id_y);
        figure, 
        axis([0, 2000, -0.15, 0.15]);
        subplot(211)
        plot(id_y);
        legend("Identification Actual Data");
        title("Prediction identification, m = " + m + ", na = nb = " + na + ", MSE = " + MSE_pred_id);
        subplot(212)
        plot(y_hat_pred, 'r'); 
        legend("Identification Prediction Data");

        %validation
        phi_val = arx_funct(m, na, nb, val_u, val_y);
        y_hat_val = phi_val * theta;
        squared_error_val = (y_hat_val - val_y) .^ 2;
        MSE_pred_val = sum(squared_error_val) / length(val_y);
        figure, 
        axis([0, 2000, -0.15, 0.15]);
        subplot(211)
        plot(val_y);
        legend("Validation Actual Data");
        title("Prediction validation, m = " + m + ", na = nb = " + na + ", MSE = " + MSE_pred_val);
        subplot(212)
        plot(y_hat_val, 'r'); 
        legend("Validation Prediction Data");

        %simulation

        %identification
        phi_sim_id = zeros(length(id_u), no_of_columns_of_phi);
        id_y_sim = zeros(length(id_u), 1);
        for k = 1 : length(id_u)
            phi_sim_id(k, :) = arx_sim(m, na, nb, id_u, id_y_sim, k);
            id_y_sim(k) = phi_sim_id(k, :) * theta;
        end
        squared_error_sim_id = (id_y_sim - id_y) .^ 2;
        MSE_sim_id = sum(squared_error_sim_id) / length(id_y);
        figure, 
        %axis([0, 2000, -0.15, 0.15]);
        subplot(211)
        plot(id_y, 'b');
        legend("Identification Actual Data");
        title("Simulation identification, m = " + m + ", na = nb = " + na + ", MSE = " + MSE_sim_id);
        subplot(212)
        plot(id_y_sim, 'r'); 
        legend("Identification Simulation Data");

        %validation
        phi_sim_val = zeros(length(val_u), no_of_columns_of_phi);
        val_y_sim = zeros(length(val_u), 1);
        for k = 1 : length(val_u)
            phi_sim_val(k, :) = arx_sim(m, na, nb, val_u, val_y_sim, k);
            val_y_sim(k) = phi_sim_val(k, :) * theta;
        end
        squared_error_sim_val = (val_y_sim - val_y) .^ 2;
        MSE_sim_val = sum(squared_error_sim_val) / length(val_y);
        figure, 
        %axis([0, 2000, -0.15, 0.15]);
        subplot(211)
        plot(val_y, 'b');
        legend("Validation Actual Data");
        title("Simulation validation, m = " + m + ", na = nb = " + na + ", MSE = " + MSE_sim_val);
        subplot(212)
        plot(val_y_sim, 'r'); 
        legend("Validation Simulation Data");

end

