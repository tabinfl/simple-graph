WITH RECURSIVE traverse(x, y, obj) AS (
  SELECT :source, '()', '{}'
  UNION
  SELECT uid, '()', body FROM nodes JOIN traverse ON uid = x
  UNION
  SELECT source, '<-', properties FROM edges JOIN traverse ON target = x
  UNION
  SELECT target, '->', properties FROM edges JOIN traverse ON source = x
) SELECT x, y, obj FROM traverse;
