% parallel computation
pc = parcluster('local');
disp('Information of local parcluster:')
disp(pc); 

try
    parpool(pc.NumWorkers);
catch ME
    fprintf('Error from try: %s \n',ME.message);
end