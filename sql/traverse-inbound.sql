WITH RECURSIVE traverse(uid) AS (
  SELECT :source
  UNION
  SELECT source FROM edges JOIN traverse ON target = uid) SELECT uid FROM traverse;
