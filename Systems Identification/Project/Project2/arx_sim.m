function phi_line = arx_sim(m, na, nb, id_u, id_y, k)
        %first come the standard attributions for m = 1
        phi_line = [1];
        for ii = 1 : na
            if(k > ii)
                phi_line = [phi_line, id_y(k - ii)];
            else
                phi_line = [phi_line, 0];
            end
        end
        for ii = 1 : nb
            if(k > ii)
                phi_line = [phi_line, id_u(k - ii)];
            else
                phi_line = [phi_line, 0];
            end
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
end