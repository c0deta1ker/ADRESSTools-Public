function view_pixsad_props(element)
% view_pixsad_props(element)
%   This is a function that plots the photoionisation cross-sections and
%   asymmetry parameters of all the core-levels for a particular element
%   defined by the user. This can be used to quickly view all the available 
%   data for a particular element.
%
%   IN:
%   -   element:	char/string of the element; e.g. "H", "He", "Si", "In"...
%
%   OUT: (figure output)

%% Default parameters (Parameters for Silicon)
if nargin < 1; element = "Si";  end
if isempty(element); element = "Si"; end
%% - Extracting the PIXSA properties from the Database
[hv, xsect, asymmetry] = get_pixsad_props(element);
%% - Initialising the figure
pp = plot_props();
fig = figure(); hold on;
fig.Position(3) = 2.5*pp.fig5x4(1); 
fig.Position(4) = pp.fig5x4(2);
%% - Plotting the photoionisation cross-section
subplot(121); hold on;
if istable(xsect)
    for i = 1:size(xsect,2)
        plot(hv{:,1}, xsect{:,i}, '.-');
    end
    legend(xsect.Properties.VariableNames, 'location', 'best');
else
    plot(hv, xsect, '.-');
end
title('Photoionisation Cross Section (sigma)');
xlabel('Photon Energy [eV]');
ylabel('Cross Section [Mbarn]');
loglog_props(); grid on;
text(0.05, 0.07, string(element), 'FontSize', 18, 'color', 'k', 'Units','normalized', 'FontWeight', 'bold');
% - Plotting the asymmetry
subplot(122); hold on;
if istable(asymmetry)
    for i = 1:size(asymmetry,2)
        plot(hv{:,1}, asymmetry{:,i}, '.-');
    end
    legend(asymmetry.Properties.VariableNames, 'location', 'best');
else
    plot(hv, asymmetry, '.-');
end
title(' Asymmetry Parameter (beta) ');
xlabel(' Photon Energy [eV] ');
ylabel(' Asymmetry ');
gca_props(); grid on;
text(0.05, 0.07, string(element), 'FontSize', 18, 'color', 'k', 'Units','normalized', 'FontWeight', 'bold');

end