# Universe Database README

## Overview

The Universe Database is designed to store detailed information about various celestial entities, including galaxies, stars, planets, and moons. This README provides a comprehensive guide on the structure of the database, including tables, columns, and constraints.

## Table Structures

### Table: `galaxy`

| Column       | Type                  | Collation | Nullable | Default | Description                      |
|--------------|-----------------------|-----------|----------|---------|----------------------------------|
| name         | character varying(20) |           | false    |         | Name of the galaxy               |
| galaxy_id    | integer               |           | false    |         | Unique identifier for the galaxy |
| is_active    | boolean               |           | true     |         | Indicates if the galaxy is active|
| type         | text                  |           | true     |         | Type of galaxy (e.g., Spiral)    |
| composition  | text                  |           | true     |         | Composition of the galaxy        |

Indexes:
- `galaxy_pkey` PRIMARY KEY, btree (`galaxy_id`)

Referenced by:
- Table `star`: `fk_galaxy` FOREIGN KEY (`galaxy_id`) REFERENCES `galaxy` (`galaxy_id`)

### Table: `star`

| Column        | Type                  | Collation | Nullable | Default | Description                      |
|---------------|-----------------------|-----------|----------|---------|----------------------------------|
| name          | character varying(20) |           | false    |         | Name of the star                 |
| star_id       | integer               |           | false    |         | Unique identifier for the star   |
| solar_system  | text                  |           | true     |         | Name of the solar system         |
| galaxy_id     | integer               |           | true     |         | Foreign key referencing `galaxy` |
| type          | text                  |           | true     |         | Type of star (e.g., G-type)      |

Indexes:
- `star_pkey` PRIMARY KEY, btree (`star_id`)

Foreign-key constraints:
- `fk_galaxy` FOREIGN KEY (`galaxy_id`) REFERENCES `galaxy` (`galaxy_id`)

Referenced by:
- Table `planet`: `fk_star` FOREIGN KEY (`star_id`) REFERENCES `star` (`star_id`)

### Table: `planet`

| Column            | Type                  | Collation | Nullable | Default | Description                      |
|-------------------|-----------------------|-----------|----------|---------|----------------------------------|
| name              | character varying(20) |           | false    |         | Name of the planet               |
| planet_id         | integer               |           | false    |         | Unique identifier for the planet |
| circumference_km  | integer               |           | true     |         | Circumference of the planet (km) |
| diameter_km       | integer               |           | true     |         | Diameter of the planet (km)      |
| is_habitable      | boolean               |           | true     |         | Indicates if the planet is habitable |
| star_id           | integer               |           | true     |         | Foreign key referencing `star`   |

Indexes:
- `planet_pkey` PRIMARY KEY, btree (`planet_id`)

Foreign-key constraints:
- `fk_star` FOREIGN KEY (`star_id`) REFERENCES `star` (`star_id`)

### Table: `moon`

| Column            | Type                  | Collation | Nullable | Default | Description                      |
|-------------------|-----------------------|-----------|----------|---------|----------------------------------|
| name              | character varying(20) |           | false    |         | Name of the moon                 |
| moon_id           | integer               |           | false    |         | Unique identifier for the moon   |
| gravitational_acc | real                  |           | true     |         | Gravitational acceleration (m/s²)|
| planet_id         | integer               |           | true     |         | Foreign key referencing `planet` |
| circumference_km  | integer               |           | true     |         | Circumference of the moon (km)   |

Indexes:
- `moon_pkey` PRIMARY KEY, btree (`moon_id`)

Foreign-key constraints:
- `fk_planet` FOREIGN KEY (`planet_id`) REFERENCES `planet` (`planet_id`)

### Table: `constellation`

| Column            | Type                  | Collation | Nullable | Default | Description                      |
|-------------------|-----------------------|-----------|----------|---------|----------------------------------|
| constellation_id  | integer               |           | false    |         | Unique identifier for the constellation |
| name              | character varying(20) |           | false    |         | Name of the constellation        |
| abbreviation      | character varying(10) |           | true     |         | Abbreviation of the constellation|
| description       | text                  |           | true     |         | Description of the constellation |
| zodiac            | text                  |           | true     |         | Zodiac sign of the constellation |

Indexes:
- `constellation_pkey` PRIMARY KEY, btree (`constellation_id`)
