-- Create patients table:

CREATE TABLE patients (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(250),
    date_of_birth DATE,
    PRIMARY KEY (id)
);

-- Create medical_histories table:

CREATE TABLE medical_histories (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INTEGER REFERENCES patients(id),
    status VARCHAR(250),
    PRIMARY KEY (id)
);

-- Create invoices table

CREATE TABLE invoices (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history__id INTEGER REFERENCES medical_histories(id),
    PRIMARY KEY (id)
);

-- Create treatments table

CREATE TABLE treatments (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(250),
    name VARCHAR(250),
    PRIMARY KEY (id)
);

-- Create invoice_items table

CREATE TABLE invoice_items (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL,
    quantity INTEGER,
    total_price DECIMAL,
    invoice_id INTEGER REFERENCES invoices(id),
    treatment_id INTEGER REFERENCES treatments(id),
    PRIMARY KEY (id)
);

-- Create many to many relation :

CREATE TABLE medical_treatments (
    id INTEGER GENERATED ALWAYS AS IDENTITY,
    medical_histories_id INTEGER REFERENCES medical_histories(id),
    treatments_id INTEGER REFERENCES treatments(id),
    PRIMARY KEY (id)
);

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
CREATE INDEX ON medical_histories_has_treatments (medical_history_id);
CREATE INDEX ON medical_histories_has_treatments (treatment_id);