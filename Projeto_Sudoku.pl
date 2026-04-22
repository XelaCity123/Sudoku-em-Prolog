sudoku(M, MR):- 
    transpose(M, MT),         % Obtém a matriz transposta de M
    fill_sudoku(M, MR, MT),   % Preenche a matriz com números válidos
    valid_Matrix(MR), 
    print_sudoku(MR).         % Verifica se a matriz resultante é válida

% Preenche a matriz do Sudoku
fill_sudoku([], [], _).  % Caso base: quando a matriz de entrada está vazia, a saída também está vazia
fill_sudoku([X|XT], [XR|XRT], MT) :-  % Percorre cada linha da matriz
    fill_row(X, XR, MT, 0),  % Preenche a linha com valores válidos
    all_Different(XR),       % Garante que todos os números na linha são diferentes
    fill_sudoku(XT, XRT, MT).% Processa o restante da matriz recursivamente

% Preenche uma linha do Sudoku
fill_row([], [], _, _). % Caso base: fim da linha
fill_row([X|XT], [X|YT], MT, ColI) :- % Caso em que o valor já está preenchido
    X \= 0, % Mantém valores já definidos
    NextColI is ColI + 1, % Avança para a próxima coluna
    fill_row(XT, YT, MT, NextColI).

% Preenche uma posição vazia (0) com um valor válido
fill_row([0|XT], [Y|YT], MT, ColI) :-  
    between(1, 9, Y),   % Escolhe um número entre 1 e 9
    \+member(Y, XT),    % Garante que o número não está repetido na linha
    nth0(ColI, MT, Col),% Obtém a coluna correspondente
    \+member(Y, Col),   % Garante que o número não está repetido na coluna
    NextColI is ColI + 1,  % Avança para a próxima coluna
    fill_row(XT, YT, MT, NextColI). 

% Verifica se a matriz final é válida
valid_Matrix(M):- 
    transpose(M, MT),    % Obtém as colunas como listas
    check_all_lines(MT), % Verifica se todas as colunas são válidas
    check_squares(M).    % Verifica se todos os quadrados 3x3 são válidos

% Transpõe uma matriz
transpose([[]|_], []).
transpose(M, [X|T1]) :- transpose_first(M, X, L), transpose(L, T1).
transpose_first([], [], []).
transpose_first([[X|T]|T2], [X|XT], [T|TT]) :- transpose_first(T2, XT, TT).

% Verifica se todos os elementos de uma lista são diferentes
all_Different([]).
all_Different([X|T]):- \+member(X, T), all_Different(T).

% Verifica se todas as linhas da matriz são válidas
check_all_lines([]).
check_all_lines([X|T]):- all_Different(X), check_all_lines(T).

% Divide a matriz em nove linhas e verifica os quadrados 3x3
check_squares(M):- 
    M = [L1, L2, L3, L4, L5, L6, L7, L8, L9], 
    square(L1, L2, L3), square(L4, L5, L6), square(L7, L8, L9).

% Verifica se um bloco 3x3 contém apenas números diferentes
square([], [], []).
square([X1, X2, X3 | T1], [X4, X5, X6 | T2], [X7, X8, X9 | T3]):- 
    all_Different([X1, X2, X3, X4, X5, X6, X7, X8, X9]),
    square(T1, T2, T3).

% Imprime a matriz Sudoku formatada
print_sudoku([]).
print_sudoku([H|T]) :-
    write(H), nl, % Escreve a linha e pula para a próxima
    print_sudoku(T).   

%PREDICADO NTH0(X, Y, Z).
%nth0(0, [X|_], X). 
%nth0(I, [_|XT], X) :- 
%    I > 0, 
%    INext is I - 1, 
%    nth0(INext, XT, X).

%PREDICADO MEMBER(X, T).
%member(X, [X|_]).
%member(X, [_|T]) :- member(X,T).

%PREDICADO BETWEEN(X, Y, Z).
%between(X, Y, X) :- X =< Y.
%between(X, Y, Z) :- 
%    X < Y, 
%    XNext is X + 1, 
%    between(XNext, Y, Z).