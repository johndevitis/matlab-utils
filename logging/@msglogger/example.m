function logg = example(N)
%% Message Logger [msglog] Example. 
%
% author: john devitis
% create date: 11272016
clc
fprintf('Message Log Example:\n');

% The number of iterations (in seconds).
if nargin<1; N = 10; end

% Create instance of message logger.
logg = msglogger('Logged Loop Example');

% Print whatever we want to console (or file if fid given). 
for ii = 1:5
    logg.print('Yeehaww, lets start logging!')
end

% Do work.
logg.print('Enough of that. Lets do some work now')
logg.print('Starting Main Loop')
for n = 1:N
    
    % Log the start of a task.
    logg.start_task('Loop Iteration',n,N)
    
    % Work.
    pause(.05);   

    % Log completion. 
    logg.done_task()
    
end

% Log main process shutdown and clean up.
logg.finish()

% Clean up. 
% Error screen no output request - necessary for any handles object 
if nargout == 0
    clear logg
end