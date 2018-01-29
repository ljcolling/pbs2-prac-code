function [pressTime,keyCode] = CollectResponses(DEVICE)

pressed = 0;

while pressed == 0
    [pressed, firstpress] = KbQueueCheck(DEVICE);
end

% Get the key name and rt

keyCode = find(firstpress > 0);
pressTime = firstpress(keyCode);
