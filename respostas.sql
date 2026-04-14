-- Questão 1. Quantos bruxos nascidos-trouxa (Muggle-born) ou mestiços (Half-blood) existem em cada casa (house)? Ordene-os decrescentemente e limite a busca em quatro (4) registros. Observe que não temos certeza sobre blood_status de alguns bruxos. Mas, nós estamos buscando aqui nessa questão pelos bruxos que são Muggle-born, Half-blood ou Muggle-born or Half-blood.
SELECT House, COUNT(*) 
FROM harry_potter 
WHERE blood_status IN ('Muggle-born', 'Half-blood', 'Muggle-born or Half-blood') 
GROUP BY House 
ORDER BY COUNT(*) DESC 
LIMIT 4;
-- Questão 2 - Qual é a casa que tem a menor quantidade de sangues-puro (Pure-blood), assumindo apenas aqueles que têm-se certeza? Remova, também, aqueles casos que a casa (House) seja nula e o (Blood Status) seja nula.
SELECT House, COUNT(*) 
FROM harry_potter 
WHERE blood_status = 'Pure-blood' 
  AND House IS NOT NULL 
  AND blood_status IS NOT NULL
GROUP BY House 
ORDER BY COUNT(*) ASC 
LIMIT 1;
-- Questão 3 - Quantas pessoas existem na família Weasley (assuma pessoas com algum nome de Weasley)?
SELECT COUNT(*) 
FROM harry_potter 
WHERE name LIKE '%Weasley%';
-- Questão 4 - Existe alguém na família Weasley que não seja ruivo (Red)?
SELECT name 
FROM harry_potter 
WHERE name LIKE '%Weasley%' 
  AND hair_color <> 'Red';
-- Questão 5 - Todo bruxo consegue aprender o feitiço do patrono, um feitiço de proteção que toma forma de um animal. É um feitiço complexo e nem todos os bruxos possuem um patrono. Existem pessoas que possuem o mesmo animal patrono (patronus)? Remova os casos em que os valores sejam Unknown (do inglês, desconhecido), Non-corporeal (Não possui forma animal) ou None (nenhum) e ordene-os pela quantidade decrescentemente, limitando nos 3 maiores resultados.
SELECT patronus, COUNT(*) 
FROM harry_potter 
WHERE patronus NOT IN ('Unknown', 'Non-corporeal', 'None') 
GROUP BY patronus 
ORDER BY COUNT(*) DESC 
LIMIT 3;
-- Questão 6 - Utilizando apenas uma consulta com possibilidade de subqueries, responda: busque pelos quatro bruxas ou bruxos que possuem nomes que deram origem ao nome das casas de Hogwarts (House). Remova aqueles que sejam da espécie fantasma (Ghost). A resposta deve conter o sobrenome, o nome e a espécie.
SELECT last_name, first_name, species 
FROM harry_potter 
WHERE species <> 'Ghost' 
  AND (name LIKE '%Gryffindor%' OR name LIKE '%Hufflepuff%' 
       OR name LIKE '%Ravenclaw%' OR name LIKE '%Slytherin%');
-- Questão 7 - Existiam bruxos que não eram da casa (house) Sonserina (Slytherin) que eram leais ao Lord Voldemort? Se existiram, qual são seus nomes? Desconsidere aqueles que não estão associados a nenhuma casa. A Resposta deve conter apenas o nome desses bruxos
SELECT name 
FROM harry_potter 
WHERE House <> 'Slytherin' 
  AND loyalty LIKE '%Lord Voldemort%' 
  AND House IS NOT NULL;
-- Questão 8 - A primeira profecia de Sibila Trelawney é uma famosa profecia que colocou em dúvida quem seria o herói que teria poder para derrotar o grande vilão, Lord Voldemort. Provavelmente os bruxos não tinham um banco de dados tão interessante quanto o nosso mas a profecia tinha alguns requisitos que curiosamente alguns destes podem ser validados pelo dataset, a profecia dizia que um menino teria as seguintes características:
-- ser do gênero masculino, seus pais tinham desafiado Voldemort três vezes e sobreviveram, ele teria um poder que Voldemort era incapaz ou não queria compreender, nascido nos últimos dias de julho de 1980, ano em que a profecia foi feita (possivelmente 29, 30 ou 31)., se mais de uma pessoa nascesse que satisfizer os requisitos, o próprio Voldemort iria escolher a quem acabaria por se referir.
-- Sua meta é encontrar nomes que poderiam satisfazer nossa vontade de descobrir quem poderia ser o herói, Observação: Bom, como dizia o ditado: O inimigo do meu inimigo é meu amigo. Podemos assumir que aliados a Albus Dumbledore ou a Order of the Phoenix (Ordem da Fênix) eram também inimigos de Voldemort. Então isso pode ser um bom indicativo para tentar identificar nosso(s) herói(s). Com base nesses requisitos quem são os possíveis heróis? A resposta deve conter apenas o nome do bruxo.
SELECT name 
FROM harry_potter 
WHERE gender = 'Male' 
  AND birth LIKE '%July 1980%' 
  AND (birth LIKE '29%' OR birth LIKE '30%' OR birth LIKE '31%')
  AND (loyalty LIKE '%Order of the Phoenix%' OR loyalty LIKE '%Albus Dumbledore%');
-- Questão 9 - Busque por todos aqueles que entram nessas restrições: Nasceram em Setembro September (birth); Não faleceram (death); Não possuem nomes iguais àqueles achados na questão 7 (utilize subquery); Possuem lealdade associada a alguém (loyalty); Que seu patrono não seja Unknown nem Non-corporeal; Que possuam alguma casa (house); Sejam do gênero feminino (gender); A resposta deve conter os nomes das bruxas:
SELECT name 
FROM harry_potter 
WHERE birth LIKE '%September%' 
  AND death IS NULL 
  AND loyalty IS NOT NULL 
  AND patronus NOT IN ('Unknown', 'Non-corporeal') 
  AND House IS NOT NULL 
  AND gender = 'Female' 
  AND name NOT IN (
      SELECT name FROM harry_potter 
      WHERE House <> 'Slytherin' AND loyalty LIKE '%Lord Voldemort%'
  );
-- Questão 10 - Entre todas as habilidades, quebre-as e busque por aquelas que falem sobre as posições do Quadribol citadas anteriormente no enunciado (Seeker, Beater, Chaser e Keeper).
SELECT name, skills 
FROM harry_potter 
WHERE skills LIKE '%Seeker%' 
   OR skills LIKE '%Beater%' 
   OR skills LIKE '%Chaser%' 
   OR skills LIKE '%Keeper%';
-- Questão extra - Sabendo das informações da questão anterior (2.A), liste a quantidade de jogadores por posição;
SELECT 
    CASE 
        WHEN skills LIKE '%Seeker%' THEN 'Seeker'
        WHEN skills LIKE '%Beater%' THEN 'Beater'
        WHEN skills LIKE '%Chaser%' THEN 'Chaser'
        WHEN skills LIKE '%Keeper%' THEN 'Keeper'
    END AS Posicao, 
    COUNT(*)
FROM harry_potter
WHERE skills REGEXP 'Seeker|Beater|Chaser|Keeper'
GROUP BY Posicao;
