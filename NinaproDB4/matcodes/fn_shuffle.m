function [ Y I ] = fn_shuffle( X , DIM )
%SHUFFLE    Shuffles elements.
%   For vectors, SHUFFLE(X) shuffles the elements of X.
%   For matrices, SHUFFLE(X) shuffles the rows of X.
%   For N-D arrays, SHUFFLE(X) shuffles along the first non-singleton
%   dimension of X.
%
%   SHUFFLE(X,DIM) shuffles along the dimension DIM. If DIM is 0,
%   then all elements of X are shuffled linearly (independently of
%   any dimension).
% 
%   [Y,I] = SHUFFLE(X,DIM) also returns an index vector I.
%   If X is a vector, then Y = X(I).
%   If X is a matrix and DIM=1, then Y = X(I,:).
%
%   Examples:
%         X = [1 2 3; 4 5 6; 7 8 9]
%         X =
%              1     2     3
%              4     5     6
%              7     8     9
%
%         [Y,I] = shuffle(X)
%         Y =
%              7     8     9
%              4     5     6
%              1     2     3
%         I =
%              3     2     1
% 
%         [Y,I] = shuffle(X,2)
%         Y =
%              1     3     2
%              4     6     5
%              7     9     8
%         I =
%              1     3     2
%   Created: Ankur Jain (encorejane@gmail.com) - 01/30/2010
%

    error(nargchk(1,2,nargin));

    szi = size(X);
    if nargin < 2, DIM = find(szi,1); end

    if DIM > numel(szi)
        Y = X;
        I = 1;
        return
    end

    if DIM == 0
        Y = reshape(X(randperm(numel(X))), szi);
        return;
    end

    inds(1:numel(szi)) = {':'};
    I = randperm(szi(DIM));
    inds{DIM} = I;
    Y = X(inds{:});
end
