-- ============================================================
-- Build a Celestial Bodies Database
-- Banco: universe
-- Hierarquia: galaxy -> star -> planet -> moon
-- ============================================================

-- Cria o banco (rode isso fora de uma transação, no psql)
-- CREATE DATABASE universe;
-- \c universe

-- Apaga as tabelas se já existirem (ordem inversa por causa das FKs)
DROP TABLE IF EXISTS moon;
DROP TABLE IF EXISTS planet;
DROP TABLE IF EXISTS star;
DROP TABLE IF EXISTS galaxy;

-- ============================================================
-- Tabela: galaxy
-- ============================================================
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT
);

-- ============================================================
-- Tabela: star
-- ============================================================
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    galaxy_id INT REFERENCES galaxy(galaxy_id)
);

-- ============================================================
-- Tabela: planet
-- ============================================================
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    star_id INT REFERENCES star(star_id)
);

-- ============================================================
-- Tabela: moon
-- ============================================================
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    planet_id INT REFERENCES planet(planet_id)
);

-- ============================================================
-- Dados de exemplo
-- ============================================================

INSERT INTO galaxy (name, description) VALUES
('Via Láctea', 'Galáxia espiral onde fica o Sistema Solar'),
('Andrômeda', 'Galáxia espiral mais próxima da Via Láctea');

INSERT INTO star (name, description, galaxy_id) VALUES
('Sol', 'Estrela central do Sistema Solar', 1),
('Sirius', 'Estrela mais brilhante do céu noturno', 1);

INSERT INTO planet (name, description, star_id) VALUES
('Mercúrio', 'Planeta mais próximo do Sol', 1),
('Vênus', 'Segundo planeta a partir do Sol', 1),
('Terra', 'Nosso planeta natal', 1),
('Marte', 'O planeta vermelho', 1);

INSERT INTO moon (name, description, planet_id) VALUES
('Lua', 'Único satélite natural da Terra', 3),
('Fobos', 'Maior lua de Marte', 4),
('Deimos', 'Menor lua de Marte', 4);
