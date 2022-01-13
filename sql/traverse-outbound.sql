WITH RECURSIVE traverse(uid) AS (
  SELECT :source
  UNION
  SELECT target FROM edges JOIN traverse ON source = uid) SELECT uid FROM traverse;
