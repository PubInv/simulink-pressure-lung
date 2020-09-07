%Creators: Megan Cadena && Enrique Perez
%Date edited last: 09/06/20

%defining values
TAIP_range = [0 250 500 1000 2000];
R_range = [1 3 5 10 20];
C_range = [10 25 50 100 200];
IE_range = 2;
RR_range = [12 20 30];
IP_range = 20;
PEEP_range = 5;

%defining iteration counters
TAIP_iter_max = length(TAIP_range);
R_iter_max = length(R_range);
C_iter_max = length(C_range);
IE_iter_max = length(IE_range);
RR_iter_max = length(RR_range);
PEEP_iter_max = length(PEEP_range);

TAIP_iter = 1;
R_iter = 1;
C_iter = 1;
IE_iter = 1;
RR_iter = 1;
PEEP_iter = 1;

done = 0;
total_runs = TAIP_iter_max*R_iter_max*C_iter_max*IE_iter_max*RR_iter_max;
lung_mdl = 'MITLungPressureCorrected';%lung_mdl = 'MITLungWorking_NC';
open_system(lung_mdl);
mdlWks = get_param(lung_mdl, 'ModelWorkspace');
%Running iterations
while total_runs > 0
if RR_iter == RR_iter_max
    RR_iter = 1;
    if IE_iter == IE_iter_max
        IE_iter = 1;
        if C_iter == C_iter_max
            C_iter = 1;
            if R_iter == R_iter_max
                R_iter = 1;
                if PEEP_iter == PEEP_iter_max
                    PEEP_iter = 1;
                    if TAIP_iter == TAIP_iter_max
                        done = 1;
                    else
                        TAIP_iter = TAIP_iter + 1;
                    end
                else
                    PEEP_iter = PEEP_iter + 1;
                end
            else
                R_iter = R_iter + 1;
            end
        else
            C_iter = C_iter + 1;
        end
    else
        IE_iter = IE_iter + 1;
    end
else
    RR_iter = RR_iter + 1;
    end
%Calling Simulation
 assignin(mdlWks,'TAIP', TAIP_range(TAIP_iter));
 assignin(mdlWks,'respiratory_rate', RR_range(RR_iter));
 assignin(mdlWks,'IE',IE_range(IE_iter));
 assignin(mdlWks,'input_pressure',IP_range);
 assignin(mdlWks,'C_respiratory',C_range(C_iter));
 assignin(mdlWks,'R_respiratory',R_range(R_iter));
 assignin(mdlWks, 'p_crack', PEEP_range(PEEP_iter));
 assignin(mdlWks, 'pressure_increment', 0);
 assignin(mdlWks, 'minute_volume', 0);
 assignin(mdlWks, 'T_period', 60/RR_range(RR_iter));
%debugs
out = sim(lung_mdl);
total_runs = total_runs - 1;

%Clearing variables except iteration parameters
clearvars -except TAIP_range R_range C_range IE_range RR_range IP_range PEEP_range TAIP_iter_max R_iter_max C_iter_max IE_iter_max RR_iter_max PEEP_iter_max TAIP_iter R_iter C_iter IE_iter RR_iter PEEP_iter done total_runs lung_mdl mdlWks pressure_increment minute_volume T_period RunNum;

end  
