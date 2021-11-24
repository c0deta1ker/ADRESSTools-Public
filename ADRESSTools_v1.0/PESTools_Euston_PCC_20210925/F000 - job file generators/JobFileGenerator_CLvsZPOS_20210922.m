function JobFileGenerator_CLvsZPOS_20210922()
%% (A) Defining the consistent parameters
% (A1) Set the output file name to be saved as
sample_name = "Brugg";
filename    = char("JobFile_CLvsZPOS_" + sample_name + "_"+ string(datestr(now,'yyyymmdd_HHMMSS')));
% (A2) Set the list of photon energies to be used
Energies   	= 578 .* ones(1,20);
% (A3) Define the total number of repeat acquisitions for high statistics (only applies to sample measurements, not Ef)
Repeats   	= 1;
% (A4) Define the list of relevant core-levels
cl_fm_Au4d  = '-86.00';     cl_sm_Au4d  = '-91:0.02:-82';
cl_fm_In4d  = '-17.00';     cl_sm_In4d  = '-25:0.02:-10';
cl_fm_As3d  = '-41.00';     cl_sm_As3d  = '-46:0.02:-37';    % to include the oxide, use: '-51:0.02:-37';
cl_fm_Al2p  = '-74.00';     cl_sm_Al2p  = '-82:0.02:-71';
cl_fm_In3d  = '-444.00';    cl_sm_In3d  = '-449:0.02:-440';  % to include other SO component, use: '-456:0.05:-440';
cl_fm_O1s   = '-533.00';    cl_sm_O1s   = '-538:0.02:-529';
% (A5) Define the list of other useful binding energy ranges
vb_eb       = '-2.00';
cl_survey   = '-555:0.05:5';

%% (B) Set the SAMPLE measurement position
% - POSITION
x_samp      ='-1.704';
y_samp      ='-7.251';
z_samp      = 0.0:0.2:1.0;
tilt_samp   ='0.0'; 
theta_samp  ='0.0';
phi_samp    ='-57';
% - ACQUISITION SETTINGS
slitXPS_samp	= '1';	slitVB_samp		= '20'; 
dtXPS_samp	= '0.1';    dtVB_samp    	= '60';
pol_samp 	= 'CP';
mode_samp 	= 'MAM';
Ep_samp   	= '100'; 

%% (C) Set the Fermi-level REFERENCE position
use_ref     = 1;	% Set whether you want to use a reference; 1 = True, 0 = False
% - POSITION
x_ref       = x_samp;
y_ref       = y_samp;
z_ref       = z_samp;
tilt_ref    = tilt_samp;
theta_ref   = theta_samp;
phi_ref     = phi_samp;
% - ACQUISITION SETTINGS
% slit_ref = '1'; dt_ref = '0.1'; Eb_ref = '-86';     % XPS, Au(4d) reference
slit_ref = '20'; dt_ref = '30'; Eb_ref = '-2';      % ARPES, Fermi-Edge reference for metallic samples
pol_ref 	= pol_samp;
mode_ref	= mode_samp;
Ep_ref      = Ep_samp;

%% (D) Initialising the JobFile with the first entries
% -- Regular Energy Jobs
% ii=1;
% Position(ii).name='VB'; Position(ii).mode=mode_samp; Position(ii).Ep=Ep_samp;
% Position(ii).pol=pol_samp; Position(ii).slit=slitVB_samp; Position(ii).dT=dtVB_samp;
% Position(ii).Eb='-2.00';
% Position(ii).tilt=tilt_samp; Position(ii).theta=theta_samp; Position(ii).phi=phi_samp;
% Position(ii).x=x_samp; Position(ii).y=y_samp; Position(ii).z=char(z_samp(1));

ii=1;
Position(ii).name='In4d'; Position(ii).mode=mode_samp; Position(ii).Ep=Ep_samp;
Position(ii).pol=pol_samp; Position(ii).slit=slitXPS_samp; Position(ii).dT=dtXPS_samp;
Position(ii).Eb='-25:0.02:-10';
Position(ii).tilt=tilt_samp; Position(ii).theta=theta_samp; Position(ii).phi=phi_samp;
Position(ii).x=x_samp; Position(ii).y=y_samp; Position(ii).z=char(z_samp(1));

ii=ii+1;
Position(ii).name='As3d'; Position(ii).mode=mode_samp; Position(ii).Ep=Ep_samp;
Position(ii).pol=pol_samp; Position(ii).slit=slitXPS_samp; Position(ii).dT=dtXPS_samp;
Position(ii).Eb='-46:0.02:-37';
Position(ii).tilt=tilt_samp; Position(ii).theta=theta_samp; Position(ii).phi=phi_samp;
Position(ii).x=x_samp; Position(ii).y=y_samp; Position(ii).z=char(z_samp(1));

% ii=ii+1;
% Position(ii).name='Al2p'; Position(ii).mode=mode_samp; Position(ii).Ep=Ep_samp;
% Position(ii).pol=pol_samp; Position(ii).slit=slitXPS_samp; Position(ii).dT=dtXPS_samp;
% Position(ii).Eb='-82:0.02:-71';
% Position(ii).tilt=tilt_samp; Position(ii).theta=theta_samp; Position(ii).phi=phi_samp;
% Position(ii).x=x_samp; Position(ii).y=y_samp; Position(ii).z=char(z_samp(1));

% ii=ii+1;
% Position(ii).name='C1s'; Position(ii).mode=mode_samp; Position(ii).Ep=Ep_samp;
% Position(ii).pol=pol_samp; Position(ii).slit=slitXPS_samp; Position(ii).dT=dtXPS_samp;
% Position(ii).Eb='-290:0.02:-280';
% Position(ii).tilt=tilt_samp; Position(ii).theta=theta_samp; Position(ii).phi=phi_samp;
% Position(ii).x=x_samp; Position(ii).y=y_samp; Position(ii).z=char(z_samp(1));

% ii=ii+1;
% Position(ii).name='In3d';Position(ii).mode=mode_samp;Position(ii).Ep=Ep_samp;
% Position(ii).pol=pol_samp;Position(ii).slit=slitXPS_samp;Position(ii).dT=dtXPS_samp;
% Position(ii).Eb='-449:0.02:-440';
% Position(ii).tilt=tilt_samp;Position(ii).theta=theta_samp;Position(ii).phi=phi_samp;
% Position(ii).x=x_samp;Position(ii).y=y_samp;Position(ii).z=char(z_samp(1));

% ii=ii+1;
% Position(ii).name='O1s';Position(ii).mode=mode_samp;Position(ii).Ep=Ep_samp;
% Position(ii).pol=pol_samp;Position(ii).slit=slitXPS_samp;Position(ii).dT=dtXPS_samp;
% Position(ii).Eb='-538:0.02:-529';
% Position(ii).tilt=tilt_samp;Position(ii).theta=theta_samp;Position(ii).phi=phi_samp;
% Position(ii).x=x_samp;Position(ii).y=y_samp;Position(ii).z=char(z_samp(1));

%% (E) Generate the JobFile Table
fid     = fopen([filename '.txt'],'wt');
head    = '/*File|Comment|hv|Pol|Slit|Mode|Epass|Eb/Ek|Range|dt(s)|Theta|Tilt|Azimuth|X|Y|Z*/'; fprintf(fid,'%s\n',head);
index   = 1;
% - Filing through each one of the photon energies
for z_indx = 1:length(z_samp)
    for hv_indx = 1:length(Energies)
        hv      = Energies(hv_indx);
        ZSAM    = z_samp(z_indx);
        % -- Filing through Position
        for kk=1:length(Position)
            if use_ref == 1
                ZREF    = z_ref(z_indx);
                line=strcat(num2str(index, '%02.f'),'_',Position(kk).name,'_hv=',num2str(hv),'_EF||',num2str(hv),'|',pol_ref,'|',slit_ref,'|',mode_ref,'|',Ep_ref,'|','Eb','|',Eb_ref,'|',dt_ref,'|1|',theta_ref,'|',tilt_ref,'|',phi_ref,'|',x_ref,'|',y_ref,'|',string(ZREF),'|');
                fprintf(fid,'%s\n',line);
                index=index+1;
            end
            line=strcat(num2str(index, '%02.f'),'_',Position(kk).name,'_hv=',num2str(hv),'||',sprintf("ones(%i)*",Repeats)+num2str(hv),'|',Position(kk).pol,'|',Position(kk).slit,'|',Position(kk).mode,'|',Position(kk).Ep,'|','Eb','|',Position(kk).Eb,'|',Position(kk).dT,'|1|',Position(kk).theta,'|',Position(kk).tilt,'|',Position(kk).phi,'|',Position(kk).x,'|',Position(kk).y,'|',string(ZSAM),'|');
            fprintf(fid,'%s\n',line);
            index=index+1;
        end
    end
end
fclose(fid);
end