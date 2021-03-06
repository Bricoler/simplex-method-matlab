t = importdata('./data/ex6_4.txt', ' ');
epsilon = 1e-8;

% Pivot selection avoiding degeneration
mode = 'SRR';
[nrow, ncol] = size(t);
for i=2:nrow
    if t(i, 1) < 0
        t(i,:) = -t(i,:);
   end
end

% Check if given table is canonical form
% If not, implement two-phase simplex method
canonical = isCanonical(t);

if ~canonical
    disp('Given table is not canonical form!');
    cfset = getCanonical(t, mode);
    if strcmp(cfset.state, 'none')
        return;
    end
    
    t = cfset.table;
else
    disp('Given table is canonical form!');
    fprintf('\n');
end
[nrow, ncol] = size(t);
initial_bfs = zeros(1, ncol-1);

for j=2:ncol
    if abs(t(1,j)) < epsilon
        for i=2:nrow
            if abs(t(i,j) - 1) < epsilon
                initial_bfs(j-1) = t(i,1);
            end
        end
    end
end

% solSet: result from the algorithm
% solSet.table: last tableau form
% solSet.basic_sequence: the order of basic sequence of an optimum
% solSet.optSol: an optimal solution
% solSet.objectiveValue: the objective value of an optimum
% solSet.iteration: the number of iterations to get an optimum
% solSet.state: state of the solution
solSet = simplex(t, mode);

if ~strcmp(solSet.state, 'optimal')
    return;
end
disp('optimal solution:');
disp(solSet.optSol);
disp('Optimal Solution Obtained!');