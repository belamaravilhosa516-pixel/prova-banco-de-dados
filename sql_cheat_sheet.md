# 📘 SQL Cheatsheet

## 💡 Dicas

-   Conteúdo textual e de datas deve ser usado entre aspas: "Ada
    Lovelace"
-   Conteúdo numérico é usado diretamente: 2178348
-   Sempre tente resolver da forma mais simples possível
-   Muitos problemas podem ser resolvidos com: SELECT, ORDER BY e LIMIT

## 🚀 Dicas Avançadas

-   Sempre use WHERE antes de UPDATE ou DELETE
-   Teste com SELECT antes de alterar dados
-   Use LIMIT para evitar consultas pesadas
-   Evite SELECT \*
-   Use DISTINCT para evitar duplicidade
-   Comente queries complexas

## ⚡ Boas Práticas

-   Padronize nomes de tabelas e colunas
-   Indente suas queries
-   Evite duplicação de lógica

## 🧠 Performance

-   Use índices (INDEX)
-   Evite funções no WHERE
-   Prefira JOIN ao invés de subqueries
-   Cuidado com ORDER BY em tabelas grandes

## 🔎 Debug

-   Verifique nomes de colunas
-   Use COUNT(\*) para validar dados
-   Use LIMIT para inspeção

## 🛡️ Segurança

-   Use prepared statements
-   Evite SQL Injection

## 📊 Comandos Básicos

### SELECT

``` sql
SELECT coluna FROM tabela;
SELECT * FROM notas_aluno;
SELECT nome, nota FROM notas_aluno;
```

### SELECT com WHERE

``` sql
SELECT * FROM notas_aluno WHERE nota = 10;
SELECT nota, disciplina FROM notas_aluno WHERE nome = "Alan Turing";
```

### INSERT

``` sql
INSERT INTO notas_aluno(matricula, nome, nota, disciplina)
VALUES (1232, "Pablo Hildo", 10, "História");
```

### UPDATE

``` sql
UPDATE notas_aluno SET nota = 9 WHERE nome = "Irene Adler";
```

### DELETE

``` sql
DELETE FROM notas_aluno WHERE nome = "Greg Lestrade";
```

## 📈 Funções

### COUNT

``` sql
SELECT COUNT(*) FROM imoveis WHERE total <= 20000;
```

### SUM

``` sql
SELECT SUM(total) FROM imoveis WHERE cidade = 'São Paulo';
```

### AVG

``` sql
SELECT AVG(total) FROM imoveis WHERE total >= 100000;
```

## 📑 Ordenação e Agrupamento

### ORDER BY

``` sql
SELECT * FROM casas WHERE total <= 150000 ORDER BY total ASC;
```

### GROUP BY

``` sql
SELECT area, COUNT(area)
FROM casas
GROUP BY area;
```

### LIMIT

``` sql
SELECT * FROM casas LIMIT 200;
```

## 🧱 Tipos de Dados

-   VARCHAR
-   TEXT
-   DATE
-   TIMESTAMP
-   INTEGER
-   REAL
-   BOOLEAN

## ⚖️ Operadores

### Comparação

-   \<

-   =

-   \<=

-   =

-   \<\>

### Lógicos

-   AND
-   OR
-   NOT
-   IS
-   IS NOT