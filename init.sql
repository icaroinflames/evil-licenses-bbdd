-- USERS --

CREATE TABLE IF NOT EXISTS public.users
(
    user_id SERIAL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    password character varying(60) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (user_id),
    CONSTRAINT email UNIQUE (email)
);

ALTER TABLE IF EXISTS public.users
    OWNER to admin;

CREATE TABLE IF NOT EXISTS public.roles
(
    rol_id serial,
    name character varying(50),
    description character varying(255),
    PRIMARY KEY (rol_id)
);

ALTER TABLE IF EXISTS public.roles
    OWNER to admin;

CREATE TABLE IF NOT EXISTS public.user_roles
(
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    PRIMARY KEY (user_id, role_id)
);

ALTER TABLE IF EXISTS public.user_roles
    OWNER to admin;

-- LICENSES --

CREATE TABLE IF NOT EXISTS public.products
(
    product_id integer NOT NULL,
    description character varying(255),
    PRIMARY KEY (product_id)
);

ALTER TABLE IF EXISTS public.products
    OWNER to admin;

CREATE TABLE IF NOT EXISTS public.license_types
(
    license_type_id serial,
    product_id integer NOT NULL,
    duration integer NOT NULL

);

ALTER TABLE IF EXISTS public.license_types
    OWNER to admin;

CREATE TABLE IF NOT EXISTS public.liceneses
(
    license_id serial,
    user_id integer,
    mail character varying(255),
    PRIMARY KEY (license_id, user_id, mail)
);

ALTER TABLE IF EXISTS public.liceneses
    OWNER to admin;

-- TABLES INITIALIZATION --
INSERT INTO public.products(product_id, description) VALUES (0, 'EVIL PRODUCT ONE');
INSERT INTO public.products(product_id, description) VALUES (1, 'EVIL PRODUCT TWO');

INSERT INTO public.roles (name, description) VALUES ('admin', 'can create basic users an licenses');
INSERT INTO public.roles (name, description) VALUES ('user', 'can admin his own licenses');

