function createThesisPlot(comparison)

    for i = 1:length(comparison)

        comparison(i).plot('LineWidth',2);
        hold on

    end

    xlim([50,20e3])
    ylim([-5,5])
    xlabel('Frequency (Hz)')
    ylabel('Difference (dB)')
    
    % Formatting the legend
    ax = gca;
    hleg = legend();
    hleg.Title.String = 'Elevation Angle';
    hleg.Title.FontWeight = 'Bold';
    hleg.Location = 'EastOutside';
    
    if ax.YLim == [-5,5]
        ax.YTick = -5:1:5;
    end
    
    ax.XColor = [0 0 0];
    ax.YColor = [0 0 0];
    
    title('')
    
    legend('Autoupdate','off')
    l = yline(0,'k--','LineWidth',4);
    
    
    % Set ConstantLine to 'back'
    % Temporarily disable the warning that appears when accessing 
    % the undocumented properties.
    warnState = warning('off','MATLAB:structOnObject');
    cleanupObj = onCleanup(@()warning(warnState)); 
    Sl = struct(l);        % Get undocumented properties (you'll get a warning)
    clear('cleanupObj')      % Trigger warning reset
    Sl.Edge.Layer = 'back'; % Set ConstantLine uistack
    
    h = gcf;
    h.Position(3:4) = [6.5,3];

end