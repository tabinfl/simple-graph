CREATE TABLE IF NOT EXISTS nodes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    body TEXT,
    uid  TEXT GENERATED ALWAYS AS (json_extract(body, '$.uid')) VIRTUAL NOT NULL UNIQUE
);

CREATE INDEX IF NOT EXISTS uid_idx ON nodes(uid);

CREATE TABLE IF NOT EXISTS edges (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    source     TEXT,
    target     TEXT,
    properties TEXT,
    UNIQUE(source, target, properties) ON CONFLICT REPLACE,
    FOREIGN KEY(source) REFERENCES nodes(uid),
    FOREIGN KEY(target) REFERENCES nodes(uid)
);

CREATE INDEX IF NOT EXISTS source_idx ON edges(source);
CREATE INDEX IF NOT EXISTS target_idx ON edges(target);
