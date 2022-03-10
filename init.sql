CREATE DATABASE app_inventory;
CREATE USER app_inventory WITH PASSWORD 'password';
GRANT ALL PRIVILEGES ON DATABASE app_inventory to app_inventory;
\c app_inventory

CREATE TABLE applications (
  application_id              INTEGER NOT NULL,
  application_name            VARCHAR(128) NOT NULL,
  business_categorization     VARCHAR(128) NOT NULL,
  data_classification         VARCHAR(128) NOT NULL,
  PRIMARY KEY     ( application_id )
);

CREATE TABLE employees (
  application_id      INTEGER NOT NULL,
  employee_id        INTEGER NOT NULL,
  employee_name      VARCHAR(128) NOT NULL,
  programming_lang    VARCHAR(128) NOT NULL,
  PRIMARY KEY     ( employee_id ),
  CONSTRAINT fk_applications FOREIGN KEY (application_id) REFERENCES applications(application_id)
);

CREATE TABLE servers (
  server_id       INTEGER NOT NULL,
  server_name     VARCHAR(128) NOT NULL,
  ip_address      VARCHAR(15) NOT NULL,
  tech_stack      VARCHAR(128) NOT NULL,
  application_id  INTEGER NOT NULL,
  employee_id        INTEGER NOT NULL,
  PRIMARY KEY ( server_id ),
  CONSTRAINT fk_employees FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);


GRANT ALL PRIVILEGES ON applications, employees, servers TO app_inventory;

INSERT INTO applications VALUES (0, 'Payroll', 'Silver', 'sensitive');
INSERT INTO applications VALUES (1, 'Help Desk', 'Gold', 'private');
INSERT INTO applications VALUES (2, 'Company Site', 'Gold', 'public');
INSERT INTO employees VALUES (0, 0, 'Lebron James', 'Python');
INSERT INTO employees VALUES (1, 1, 'Steph Curry', 'PHP');
INSERT INTO employees VALUES (2, 2, 'Joel Embiid', 'HTML');
INSERT INTO servers VALUES (0, 'server1', '52.128.142.192', 'Microsoft', 0, 0);
INSERT INTO servers VALUES (1, 'server2', '176.5.122.69', 'Cloud', 1, 1);
INSERT INTO servers VALUES (2, 'server3', '153.241.247.181','AWS', 2, 2);