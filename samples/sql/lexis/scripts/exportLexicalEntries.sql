SELECT
CONCAT('<http://www.exaple.com/lexis/LexicalEntry/', MUS.MUSID, '>'),
CONCAT('<http://www.w3.org/1999/02/22-rdf-syntax-ns#type>', ' ', '<http://www.w3.org/ns/lemon/ontolex#LexicalEntry>', ' ;'),
CONCAT('<http://www.w3.org/2000/01/rdf-schema#label>', ' "', MUS.NAMING, '"@el ;'),
IF(GRAMCATSUB.GRAMSUBCATEN is not NULL,
  CONCAT('<http://www.exaple.com/lexis/#partOfSpeech>', ' "', GRAMCATSUB.GRAMCATEN, ' ', GRAMCATSUB.GRAMSUBCATEN, '" ;'),
  CONCAT('<http://www.exaple.com/lexis/#partOfSpeech>', ' "', GRAMCATSUB.GRAMCATEN, '" ;')
),
IF(GRAMCATSUB.GRAMSUBCATEN is not NULL,
  CONCAT('<http://www.lexinfo.net/ontology/3.0/lexinfo#partOfSpeech>', ' "', GRAMCATSUB.GRAMCATEN, ' ', GRAMCATSUB.GRAMSUBCATEN, '" .'),
  CONCAT('<http://www.lexinfo.net/ontology/3.0/lexinfo#partOfSpeech>', ' "', GRAMCATSUB.GRAMCATEN, '" .')
)
-- CONCAT('http://www.lexinfo.net/ontology/3.0/lexinfo#partOfSpeech', ' "', GRAMCATSUB.GRAMCATEN, '" ;'),
-- CONCAT('http://www.lexinfo.net/ontology/3.0/lexinfo#partOfSpeech', ' "', GRAMCATSUB.GRAMSUBCATEN, '" .')
from MUS
INNER JOIN GRAMCATSUB
ON MUS.GRAMCATSUBID=GRAMCATSUB.GRAMCATSUBID
-- LIMIT 10
-- INTO OUTFILE 'lexis_lexical_entries.csv'
-- FIELDS TERMINATED BY '\t';
