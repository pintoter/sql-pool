CREATE TABLE person_audit(
    created timestamp with time zone DEFAULT current_timestamp not null,
    type_event char(1) NOT NULL DEFAULT 'I'
        CONSTRAINT ch_type_event check (type_event IN('I','U','D')),
    row_id bigint NOT NULL,
    name varchar,
    age integer,
    gender varchar,
    address varchar
);

CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $$
    BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO person_audit(row_id, name, age, gender, address)
        VALUES (NEW.id, NEW.name,NEW.age,NEW.gender,NEW.address);
    END IF;
    RETURN NEW;
    END;
    $$ language plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');