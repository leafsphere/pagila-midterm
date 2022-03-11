-- PART 1:
-- Rewrite the SQL table below to use a maximally efficient column order.
-- You may directly modify this table.

CREATE TABLE project (
    -- len=16
    developer_id UUID,

    -- len=8
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMPTZ,
    author_id BIGINT NOT NULL,

    -- len=4
    id SERIAL PRIMARY KEY,
    target_id INTEGER,
    project_id INTEGER NOT NULL UNIQUE,

    -- len=2
    action SMALLINT NOT NULL,

    -- len=-1
    data TEXT,
    target_type VARCHAR(2),
    developer_addr INET,
    title CHAR(256)
);

-- PART 2:
-- Complete the table below describing the number of bytes used by the row created by the following insert statement.
-- Use the original column order defined above,
-- and not your modified order from part 1.

INSERT INTO project VALUES (
    0,
    55,
    NULL,
    NULL,
    NULL,
    'A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11',
    NULL,
    NULL,
    88,
    12,
    'now',
    '2022-03-09T18:34:27+00:00'
);

-- Header: 23+2+7=32
-- Data: (4+4)+(8)+(16)+(4)+(2+2)+(8)+(8)=56
-- Padding: 0
-- Total: 88
