-- Table: public.users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE IF NOT EXISTS public.users
(
    user_id SERIAL,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    password character varying(60) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (user_id),
    CONSTRAINT email UNIQUE (email)
);

CREATE TABLE public.roles
(
    rol_id serial,
    name character varying(50),
    description character varying(255),
    PRIMARY KEY (rol_id)
);

CREATE TABLE public.user_roles
(
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    PRIMARY KEY (user_id, role_id)
);

ALTER TABLE IF EXISTS public.roles
    OWNER to admin;

ALTER TABLE IF EXISTS public.users
    OWNER to admin;