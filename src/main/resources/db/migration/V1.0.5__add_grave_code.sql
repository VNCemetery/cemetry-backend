ALTER TABLE public.martyr_graves ADD grave_code varchar(255) NULL;

-- ADD INDEX
CREATE INDEX martyr_graves_grave_code_index ON public.martyr_graves (grave_code);