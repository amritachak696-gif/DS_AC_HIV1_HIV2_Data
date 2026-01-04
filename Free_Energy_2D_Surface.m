% Load the data from a .dat file
data = load('nospace_with_nan_FES_trial7.dat');

% Extract columns
X = data(:,1);
Y = data(:,2);
Z = data(:,3);

% Define the number of points in the grid
numGridPoints = 600;  % You can adjust this value to control the resolution of the grid

% Create a grid for the data
xlin = linspace(min(X), max(X), numGridPoints);
ylin = linspace(min(Y), max(Y), numGridPoints);
[XGrid, YGrid] = meshgrid(xlin, ylin);

% Interpolate the free energy data onto the grid
ZGrid = griddata(X, Y, Z, XGrid, YGrid, 'cubic');

% Determine automatic contour levels based on data
% Use the unique values in the data to set the levels if needed
levels = linspace(min(ZGrid(:)), max(ZGrid(:)), 15);  % Adjust '10' to control the number of contour levels

% Plot the 2D free energy surface with colored contours
figure;
contourf(XGrid, YGrid, ZGrid, levels, 'LineStyle', 'none');  % Automatically determined contour levels
hold on;

% Add contour lines on top of the filled contours
contour(XGrid, YGrid, ZGrid, levels, 'LineColor', 'k', 'LineWidth', 1.5);  % Contour lines with automatic levels

% Customize plot appearance
xlabel('Distance 1');
ylabel('Distance 2');
title('2D Free Energy Surface with Colored Contours');
colorbar;
colormap Turbo;

%print(gcf,'-depsc','-painters','Probability_by_Matlab_r1_r2_Data_for_Contour_Plot_at_StateE.eps'); (Use line number 39 after the final editing in matlab to save the figure as .eps format)

hold off;
