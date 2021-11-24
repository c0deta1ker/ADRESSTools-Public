function imfp = imfp_tpp2m_avg(ke_dat)
% imfp = imfp_tpp2m_avg(ke_dat)
%   Function that determines the electron inelastic mean free path (IMFP) 
%   that is based on the average trend line of photoelectron kinetic
%   energies for multiple material systems. This method is considered
%   better than the universal method, but less precise than the TPP-2M
%   calculations.
%
%   REQ. FUNCTIONS: none
%
%   IN:
%   -   ke_dat:  	Nx1 column vector of the input electron kinetic energy in eV (for PES; KE = BE - PHI)
%
%   OUT:
%   -   imfp:       Nx1 column vector of the IMFP values (Angstroms)

%% - 1 - Determination of the IMFP using universal formula
% If the kinetic energy is negative, assume it is zero
ke_dat(ke_dat<0) = 0;
% Evaluating the imfp
imfp = 0.01997 .* ke_dat .^ (0.6659);       % IMFP in nano-metres
% If isnan, return zero
imfp(isnan(imfp)) = 0;
% Convert IMFP from nm to Angstroms
imfp = 10 .* imfp;
%% Ensuring the imfp is a column vector
if size(imfp, 2) >1; imfp = imfp'; end
end