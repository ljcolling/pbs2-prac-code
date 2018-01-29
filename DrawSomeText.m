function DrawSomeText(w,rect,theText)

[xCenter,yCenter] = RectCenter(rect); % get the centre coordinates
Screen('TextSize',w,24); % Set text size to 12
DrawFormattedText(w,theText,'center','center',[],60) % Draw the text



