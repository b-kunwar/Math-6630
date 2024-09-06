% Author: Bikash Kunwar / bzk0067@gmail.com
% Date: 2024-09-05
% Assignment Name: hw00

% The following class defines 3 functions for each problem respectively.
% Please follow the instruction inside each function.

classdef hw00
    methods (Static)

        function a_m = p1(m)
            % This function takes an integer m and returns the term a_m in the sequence defined by
            % a_0 = 0, a_1 = 1, a_2 = 1, and a_n = a_{n-1} + a_{n-2} + a_{n-3} for n >= 3.
            % :param m: an integer
            % :return: the m-th term in the sequence

            if m < 0
                error('m must be a non-negative integer')
            else
                a(1) = 0; % a0
                a(2) = 1; % a1
                a(3) = 1; % a2


                for i = 3:m
                    a(i+1) = a(i) + a(i-1) + a(i-2);
                end

                a_m = a(m+1);
            end

        end

        function det_A = p2(A)
            % This function takes a matrix A of size n x n and returns the determinant of A.
            % :param A: a matrix of size n x n
            % :return: the determinant of A

            if size(A,1) ~= size(A,2)
                error('A must be a square matrix')
            else

                n = size(A,1);
                if n == 1
                    det_A = A(1, 1);  % Determinant of a 1x1 matrix
                    return;
                elseif n == 2
                    det_A = A(1, 1) * A(2, 2) - A(1, 2) * A(2, 1);  % Determinant of a 2x2 matrix
                    return;
                end

                % Recursive case: Apply Laplace expansion along the first row
                det_A = 0;
                for j = 1:n
                    % Minor matrix: Remove the first row and the j-th column
                    subMatrix = A(2:end, [1:j-1, j+1:end]);

                    % Calculate cofactor
                    cofactor = (-1)^(1 + j) * hw00.p2(subMatrix);

                    % Accumulate the determinant using Laplace expansion
                    det_A = det_A + A(1, j) * cofactor;
                end

                % det_A = inf;% Write your code here, note when you call p2 function inside your function, you need to call it like this: hw00.p2(B), where B is a matrix.
            end
        end

        function p3()
            % This function should have a run time about 1 second.
            % :return: no returns

            % Start the timer
            tic;

            % Initialize a variable to track elapsed time
            elapsedTime = 0;

            % Keep looping until the elapsed time is close to 1 second
            while elapsedTime < 1
                % Check the elapsed time
                elapsedTime = toc;
            end

            % Display the actual elapsed time
            disp(['Elapsed time: ', num2str(elapsedTime), ' seconds']);

        end
    end
end
