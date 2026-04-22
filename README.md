# 🧩 Sudoku Solver em Prolog

Projeto de um **solver de Sudoku 9x9** desenvolvido em Prolog no âmbito da disciplina de Inteligência Artificial.

---

## 📌 Descrição

Este programa resolve puzzles de Sudoku representados como uma matriz 9x9, onde:
- `0` representa uma célula vazia
- Os valores são preenchidos respeitando as regras do Sudoku:
  - Números de 1 a 9
  - Sem repetições em linhas, colunas e subgrelhas 3x3

O solver utiliza **backtracking** e verificação de restrições.

---

## ⚙️ Exemplo de utilização

```prolog
?- sudoku([
 [5, 3, 0, 0, 7, 8, 0, 0, 0],
 [6, 0, 2, 1, 9, 5, 3, 4, 8],
 [1, 9, 0, 3, 4, 0, 5, 6, 7],
 [8, 0, 9, 7, 6, 1, 4, 2, 3],
 [4, 2, 6, 8, 5, 3, 0, 9, 1],
 [7, 0, 3, 9, 0, 4, 8, 5, 6],
 [9, 6, 1, 5, 3, 7, 2, 8, 4],
 [2, 8, 7, 4, 1, 9, 0, 3, 5],
 [0, 0, 5, 2, 0, 6, 1, 7, 9]
], Solution).
```

---

## 🧠 Abordagem

- Representação do Sudoku como lista de listas  
- Preenchimento das células vazias  
- Verificação de:
  - Linhas  
  - Colunas  
  - Subgrelhas 3x3  
- Uso de backtracking automático do Prolog  

---

## 🚀 Como executar

1. Instalar o SWI-Prolog  
2. Abrir o terminal e executar:

```bash
swipl
```

3. Carregar o ficheiro:

```prolog
?- [sudoku].
```

4. Executar o predicado `sudoku/2`

---

## 📁 Estrutura do projeto

```
.
├── sudoku.pl
├── README.md
```

---

## 🧪 Testes

O solver foi testado com diferentes níveis de dificuldade:
- Fácil  
- Médio  
- Difícil  

---

## 📚 Conceitos utilizados

- Programação lógica  
- Backtracking  
- Recursividade  
- Resolução de restrições  

---

## 👨‍💻 Autor(es)

- [O teu nome]

---

## 📄 Licença

Projeto desenvolvido para fins académicos.
