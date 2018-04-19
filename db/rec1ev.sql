DROP TABLE IF EXISTS usuarios CASCADE;
CREATE TABLE usuarios
(
    id         BIGSERIAL    PRIMARY KEY
  , n_paciente char(5)      NOT NULL UNIQUE
  , nombre     VARCHAR(255) NOT NULL
  , password   VARCHAR(255)
);

DROP TABLE IF EXISTS citas CASCADE;
CREATE TABLE citas
(
    id         BIGSERIAL PRIMARY KEY
  , fecha      DATE      NOT NULL
  , hora       TIME      NOT NULL
  , usuario_id BIGINT    NOT NULL REFERENCES usuarios(id)
                         ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO usuarios (n_paciente, nombre, password) VALUES
    ('A0000', 'pepe', crypt('pepe', gen_salt('bf', 13)))
  , ('A0001', 'ana', crypt('ana', gen_salt('bf', 13)))
;

INSERT INTO citas (fecha, hora, usuario_id) VALUES
    ('2019-01-01', '13:20:00', 1)
  , ('2019-02-01', '16:44:00', 2)
;
