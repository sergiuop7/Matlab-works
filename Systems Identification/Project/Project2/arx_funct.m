function phi_final = arx_funct(m, na, nb, id_u, id_y)
    %nk is always 1
    %na is always equal to nb
    phi_final = [];
    %true id_u and id_y preceded by na + nb zeros are created to multiply with 0
    %when needed, instead of attributing 0
    true_id_y = [zeros(1, na + nb)];
    true_id_u = true_id_y;
    true_id_y = [true_id_y, transpose(id_y)];
    true_id_u = [true_id_u, transpose(id_u)];
    for i = (na + nb + 1) : length(true_id_u)
        %first come the standard attributions for m = 1
        phi_line = [1];
        for ii = 1 : na
            phi_line = [phi_line, true_id_y(i - ii)];
        end
        for ii = 1 : nb
            phi_line = [phi_line, true_id_u(i - ii)];
        end
        power_one_limit = length(phi_line);
        %now the "pure" elements (singular elements raised to the highest
        %power) are added because this is the easiest next step
        for power = 2 : m
            for ii = 2 : power_one_limit
                phi_line = [phi_line, phi_line(ii) ^ power];
            end
        end
        upper_limit = length(phi_line);
        for ii = 2 : power_one_limit
            no_of_imp_elem = 1;
            %this works knowing that as m increases by one, so will the
            %number of "impure" elements increase by one at that stage of m
            %but there will always only be na + nb "pure" elements at any 
            %stage of m
            for iii = ii + 1 : (upper_limit - na - nb)
                if (iii ~= ii + no_of_imp_elem * (na + nb))                  
                    phi_line = [phi_line, phi_line(ii) * phi_line(iii)];
                else
                    no_of_imp_elem = no_of_imp_elem + 1;
                end
            end
        end
    phi_final = [phi_final; phi_line];
    end
end