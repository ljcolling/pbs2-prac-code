function DrawFixationCross(windowPtr,rect,crossLength,crossColor,crossWidth)

[xCenter,yCenter] = RectCenter(rect);

if nargin == 2
    crossLength  = 10;
    crossWidth = crossLength;
    crossColor = [0 0 0];
end

Screen('DrawLine',windowPtr,crossColor,...
    xCenter, round(yCenter - (crossLength/2)),...
    xCenter, round(yCenter + (crossLength/2)),2)

Screen('DrawLine',windowPtr,crossColor,...
    round(xCenter - (crossWidth/2)), yCenter,...
    round(xCenter + (crossWidth/2)), yCenter,2)