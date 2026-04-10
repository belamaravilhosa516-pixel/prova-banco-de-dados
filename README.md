---
##Prova de Banco de dados

---


## Instruções
- Faça o fork do repositório
- Faça download do dataset `harrypotter.sql`(https://drive.google.com/file/d/1eNK6WJCYBY8U6TCnbYUdtRHzNgpBPDwC/view?usp=sharing) e importe-o para a ferramenta `aiven`(https://aiven.io/tools/pg-playground). 
- Todas as perguntas devem ser respondidas com `consultas em SQL`.
- Se você estiver travado em alguma questão , pause por 5 minutos e depois volte para resolvê-la.
- Depois de ter respondido a todas questões salve suas queries em um arquivo chamado `provaBD.sql` e commit.
- Faça o pull request

## Observações gerais sobre o dataset

Sobre o dataset:

- O dataset possui quinze (15) colunas e fala sobre as personagens do universo de Harry Potter. O dataset lista as características de 140 personagens e as perguntas são referentes a dados que estão dentro da tabela. Nenhum conhecimento sobre o universo de Harry Potter é necessário para responder as perguntas.
- Existem campos que referem-se a características físicas e pessoais das personagens, como:
    -  cor do cabelo (**hair_colour**);
    -  cor dos olhos (**eye_colour**);
    -  espécie (**species**);
    -  tipo de sangue (**blood_status**), diz sobre as possibilidades sanguíneas de um personagem. Se possuir mais de um valor é `incerto` dizer que ele possui um tipo ou outro;
    -  gênero (**gender**);
    -  nome (**name**);
    -  profissão (**job**);
- Existem campos que referem-se a características referentes a nascimento e falecimento:
    - data de nascimento (**birth**), esse campo não está padronizado em um formato. Faça um select nele para saber mais.
    - data de falecimento (**death**), esse campo não está padronizado em um formato. Faça um select nele para saber mais.
- Existem campos que referem-se a características mágicas das personagens como:
    - habilidades (**skills**)
    - feitiço patrono (**patronus**), os valores são nomes de animais em inglês, `Unknown` para valores desconhecidos, e `None` para aqueles que não possuem patrono.
    - varinha mágica (**wand**)
    - casa de magia (**house**)
- E por fim, existe uma característica política das personagens:
    - alianças ou lealdade (**loyalty**)

- **Para entender mais sobre os campos, você pode buscar por seus valores distintos.**
- Não se preocupe em entender inglês para resolver o problema, em cada questão que buscar por alguma informação em inglês, ela será citada no enunciado.

##  Sobre Harry Potter:

- Trouxas (Muggle) e nascidos-trouxa (Muggle-born) são diferentes. Trouxas não são bruxos, enquanto os nascidos-trouxa são bruxos.
- Entre alguns bruxos, saber da sua linhagem sanguínea é importante, então existe toda uma rivalidade entre aqueles de sangue-puro (`Pure-blood`) e todos os outros.
- Um dos grandes heróis da história é Albus Dumbledore, existe várias alianças a favor dele como: a Ordem da Fênix (`Order of the Phoenix`) assim como pessoas com lealdade direta ao seu exército `Dumbledore's Army` ou até mesmo a ele.
- Um dos grandes vilões da história é o Lord Voldemort, existe duas alianças diretamente e ele: `Lord Voldemort` e os comensais da morte (`Death Eaters`).
- Lord Voldemort é o nêmesis (arqui-inimigo) de Albus Dumbledore.
- O ditado popular inimigo do meu inimigo é meu amigo é bastante verdadeiro para esse dataset.
- Existem 4 casas de magia na escola de magia Hogwarts. Cada casa valoriza um ou mais aspectos humanos.

## Grupo 1 - Questões - Contagem, Agrupamentos e Comparações

#### Questão 1. Quantos bruxos nascidos-trouxa (Muggle-born) ou mestiços (Half-blood) existem em cada casa (`house`)? Ordene-os decrescentemente e limite a busca em quatro (4) registros. Observe que não temos certeza sobre `blood_status` de alguns bruxos. Mas, nós estamos buscando aqui nessa questão pelos bruxos que são `Muggle-born`, `Half-blood` ou `Muggle-born or Half-blood`.

#### Questão 2 - Qual é a casa que tem a menor quantidade de sangues-puro (`Pure-blood`), assumindo apenas aqueles que têm-se certeza? Remova, também, aqueles casos que a casa (`House`) seja nula e o (`Blood Status`) seja nula. 

#### Questão 3 - Quantas pessoas existem na família Weasley (assuma pessoas com algum nome de Weasley)?

#### Questão 4 -  Existe alguém na família Weasley que não seja ruivo (`Red`)?

#### Questão 5 -  Todo bruxo consegue aprender o feitiço do patrono, um feitiço de proteção que toma forma de um animal. É um feitiço complexo e nem todos os bruxos possuem um patrono. Existem pessoas que possuem o mesmo animal patrono (`patronus`)? Remova os casos em que os valores sejam `Unknown` (do inglês, desconhecido), `Non-corporeal` (Não possui forma animal) ou `None` (nenhum) e ordene-os pela quantidade decrescentemente, limitando nos 3 maiores resultados.

#### Questão 6 - Utilizando apenas uma consulta com possibilidade de subqueries, responda: busque pelos quatro bruxas ou bruxos que possuem nomes que deram origem ao nome das casas de Hogwarts (`House`). Remova aqueles que sejam da espécie fantasma (`Ghost`). A resposta deve conter o sobrenome, o nome e a espécie.

#### Questão 7 -  Existiam bruxos que não eram da casa (`house`) Sonserina (`Slytherin`) que eram leais ao Lord Voldemort? Se existiram, qual são seus nomes? Desconsidere aqueles que não estão associados a nenhuma casa. A Resposta deve conter apenas o nome desses bruxos.

## Grupo 2 - Questões - Lógica

#### Questão 8 -  A primeira profecia de Sibila Trelawney é uma famosa profecia que colocou em dúvida quem seria o herói que teria poder para derrotar o grande vilão, Lord Voldemort. Provavelmente os bruxos não tinham um banco de dados tão interessante quanto o nosso mas a profecia tinha alguns requisitos que curiosamente **alguns** destes podem ser validados pelo dataset, a profecia dizia que um menino teria as seguintes características:
- ser do gênero masculino.
- seus pais tinham desafiado Voldemort três vezes e sobreviveram.
- ele teria um poder que Voldemort era incapaz ou não queria compreender.
- nascido nos últimos dias de julho de 1980, ano em que a profecia foi feita (possivelmente 29, 30 ou 31).
- se mais de uma pessoa nascesse que satisfizer os requisitos, o próprio Voldemort iria escolher a quem acabaria por se referir. 
#### Sua meta é encontrar nomes que poderiam satisfazer nossa vontade de descobrir quem poderia ser o herói.
Observação: Bom, como dizia o ditado: O inimigo do meu inimigo é meu amigo. Podemos assumir que aliados a Albus Dumbledore ou a Order of the Phoenix (`Ordem da Fênix`) eram também inimigos de Voldemort. Então isso pode ser um bom indicativo para tentar identificar nosso(s) herói(s). 

#### Com base nesses requisitos quem são os possíveis heróis? A resposta deve conter apenas o nome do bruxo.

#### Questão 9 -  Busque por todos aqueles que entram nessas restrições:
- Nasceram em Setembro `September` (`birth`);
- Não faleceram (`death`);
- Não possuem nomes iguais àqueles achados na questão 7 (utilize subquery);
- Possuem lealdade associada a alguém (`loyalty`);
- Que seu patrono não seja `Unknown` nem `Non-corporeal`;
- Que possuam alguma casa (`house`);
- Sejam do gênero feminino (`gender`);

#### A resposta deve conter os nomes das bruxas:

## Grupo 3 - Questões - Subqueries e JOIN

#### O quadribol é um esporte bastante popular entre bruxos e existem várias posições muito parecidas com o Futebol ou Volei. No Quadribol, existem o apanhador (Seeker), o artilheiro (Chaser), o batedor (Beater) e até mesmo o goleiro (Keeper); A coluna de habilidades (skills) listam várias habilidades separadas por | (barra vertical entre espaços).  Responda as perguntas abaixo com uma única consulta podendo utilizar subqueries.

**Dica: use o comando `SELECT unnest(string_to_array(skills, ' | ')) AS skills` em suas consultas**

#### Questão 10 - Entre todas as habilidades, quebre-as e busque por aquelas que falem sobre as posições do Quadribol citadas anteriormente no enunciado (Seeker, Beater, Chaser e Keeper).

#### Questão extra - Sabendo das informações da questão anterior (2.A), liste a quantidade de jogadores por posição;