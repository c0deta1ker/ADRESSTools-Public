function int = G2D(xdat, ydat, peak, x0, y0, fwhm)
% int = G2D(xdat, ydat, peak, x0, y0, fwhm)
%   Function that evaluates a 2D Gaussian curve after defining its amplitude
%   and position in the x- and y-axis. The function assumes that the FWHM
%   is identical both in the x- and y-dimensions.
%
%   REQ. FUNCTIONS: none
%
%   IN:
%   -   xdat:       Nx1 row vector of the x-axis input domain (kx for ARPES)
%   -   ydat:       1xM column vector of the y-axis input domain (Eb for ARPES)
%   -   peak:       scalar of the maximum peak height of the Gaussian.
%   -   x0:         scalar of the peak position along the x-axis of the Gaussian.
%   -   y0:         scalar of the peak position along the y-axis of the Gaussian.
%   -   fwhm:     	scalar of the full-width at half-maximum (FWHM) of the Gaussian along both x- and y-axes.
%
%   OUT:
%   -   int:        NxM column vector of the output Gaussian curve profile

%% Default parameters
if nargin < 6; fwhm = 1;  end
if nargin < 5; y0 = 0;  end
if nargin < 4; x0 = 0;  end
if nargin < 3; peak = 1;  end
if isempty(fwhm); fwhm = 1; end
if isempty(y0); y0 = 0; end
if isempty(x0); x0 = 0; end
if isempty(peak); peak = 1; end
% Validity check on inputs
if peak < 0; peak = 0; end
if fwhm < 0; fwhm = 0; end

%% - 1 - Determination of the Gaussian curve intensities
% Ensuring xdat is a row vector
if size(xdat, 1) > 1 && size(xdat, 2) == 1; xdat = xdat'; end
% Ensuring ydat is a column vector
if size(ydat, 2) > 1 && size(ydat, 1) == 1; ydat = ydat'; end
% Using the standard deviation as the input width so that the FWHM is correct
xsigma  = fwhm ./ (2*sqrt(2*log(2))); 
ysigma  = fwhm ./ (2*sqrt(2*log(2))); 
% Evaluating the normalised curve profile
int     = (1 ./ (xsigma * sqrt(2*pi))) .* (1 ./ (ysigma * sqrt(2*pi))) .* exp(-0.5.*(((xdat-x0)./xsigma).^2 + ((ydat-y0)./ysigma).^2));
% Scaling the curve profile to match the desired peak
int 	= int ./ max(int(:));
int 	= peak .* int;
% If isnan, return zero
int(isnan(int)) = 0;
end