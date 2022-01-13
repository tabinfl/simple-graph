WITH RECURSIVE traverse(uid) AS (
  SELECT :source
  UNION
  SELECT source FROM edges JOIN traverse ON target = uid  UNION
  SELECT target FROM edges JOIN traverse ON source = uid) SELECT uid FROM traverse;
