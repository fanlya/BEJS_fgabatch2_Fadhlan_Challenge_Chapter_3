CREATE or REPLACE DATABASE "BankSystem";

CREATE TABLE customers (
    customer_id uuid,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    email VARCHAR(255),
    phone VARCHAR(50),
    address TEXT NOT NULL,
    registration_date TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (customer_id)
);

CREATE TABLE account_type(
    account_type_id SERIAL,
    account_type_name VARCHAR,
    PRIMARY KEY (account_type_id)
);

CREATE TABLE account(
    account_id uuid,
    customer_id uuid,
    account_balance INTEGER,
    account_type_id INTEGER,
    created_At TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_At TIMESTAMP,
    PRIMARY KEY (account_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (account_type_id) REFERENCES account_type (account_type_id)
);

CREATE TABLE account_login(
    account_login_id uuid,
    account_id uuid,
    account_username VARCHAR,
    account_password VARCHAR,
    PRIMARY KEY (account_login_id),
    FOREIGN KEY (account_id) REFERENCES account (account_id)
);


CREATE TABLE transaction_type(
    transaction_type_id SERIAL, 
    transaction_type_description VARCHAR,
    PRIMARY KEY (transaction_type_id)
);

CREATE TABLE transaction(
    transaction_id SERIAL,
    account_id uuid,
    transaction_type_id integer,
    amount INTEGER,
    description text,
    date_issued TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (account_id) REFERENCES account (account_id),
    FOREIGN KEY (transaction_type_id) REFERENCES transaction_type (transaction_type_id)
);


INSERT INTO customers (customer_id,first_name,last_name,city,email,phone,address)
VALUES
('bbb08759-6aee-40e8-b05c-f52f660db79b','Dilan','Roze','Surabaya','dilanroze@gmail.com','089763838312','jln.sukomakmur no.1a'),
('a8c70c8b-5971-4703-bb05-db1d4b4d20da','Rudy','Buono','Magelang','rudibuono@gmail.com','089325123123','jln.makmur raya no.2b'),
('66a80ad7-e2f2-4393-af89-b8795813b920','Kisan','Santoso','Brebes','kisansantoso@gmail.com','08523412412','jln.begawan raya no.3a'),
('55a5003d-9ea0-4535-945e-8ff4594aa7d3','Rasyid','Wibawa','Yogyakarta','rasyidwibawa@gmail.com','087834214312','jln.depok sari no.23'),
('7b326879-9cf9-4c93-951b-336af0fa02b4','Lintang','Kusuma','Yogyakarta','lintangkusuma@gmail.com','0894213761237','jln.bantul raya no.14'),
('858b8729-a544-4f90-b73d-7916359e18f0','Muhammad','Faizar','Depok','muhammadfaizar@gmail.com','0867123712736','jln.margonda raya no.4b'),
('f032d3de-3df4-4696-b6ae-a6b287f9237e','Rahadian','Putra','Jakarta','rahadianputra@gmail.com','0861237126371','jln.soedirman no.2'),
('9e4e5999-9635-49a7-a1e9-8801b0d0b98e','Hanifah','Syafitri','Jakarta','hanifahsyafitri@gmail.com','08125312563','jln.raya bogor km 29 no.1A'),
('70879cfa-608f-4b34-ad3a-cf46d7d4f78e','Andika','Fadhil','Jakarta','andikafadil@gmail.com','08472132123','jln.kampung jati no.7a'),
('cfd2d900-2f18-44dd-b21b-9722d4abdead','Budi','Santoso','Surabaya','budisantoso@gmail.com','086123761273','jln.padjajaran no.12');

INSERT INTO account_type(account_type_name)
VALUES
('Platinum'),
('Gold'),
('Silver'),
('Bronze')
;

INSERT INTO account (account_id,customer_id,account_balance,account_type_id)
VALUES
('4a3c5a4b-fc1a-4aa7-a2a9-b9d798597967','bbb08759-6aee-40e8-b05c-f52f660db79b',1000000,1),
('ae0556f5-86b2-4dc5-af22-abf038f0a6c9','a8c70c8b-5971-4703-bb05-db1d4b4d20da',2000000,1),
('332d57ee-ecbd-4cc1-b02e-be910795b9df','66a80ad7-e2f2-4393-af89-b8795813b920',4000000,2),
('8a54ad93-c6d4-4fd1-a9a4-0787e1a60165','55a5003d-9ea0-4535-945e-8ff4594aa7d3',5000000,3),
('edb35f25-1cf9-4666-b1bd-7cf31d18c177','7b326879-9cf9-4c93-951b-336af0fa02b4',40000000,2),
('eed91a4b-92f8-413f-833c-23987b465471','858b8729-a544-4f90-b73d-7916359e18f0',30000000,3),
('a3253547-ce97-4563-b611-617b7d5747f7','f032d3de-3df4-4696-b6ae-a6b287f9237e',50000000,1),
('683bf78d-7ff6-460a-916b-b01e12e645d3','9e4e5999-9635-49a7-a1e9-8801b0d0b98e',9000000,3),
('7de1433c-33f1-4dbe-9946-f1f289262a11','70879cfa-608f-4b34-ad3a-cf46d7d4f78e',60000000,2),
('699cce6a-4aed-4a2f-b726-4f2a4cde7fcf','cfd2d900-2f18-44dd-b21b-9722d4abdead',56000000,1)
;

INSERT INTO account_login(account_login_id,account_id,account_username,account_password)
VALUES
('f18eb6e8-baa1-44e2-81e1-637da1e11296','4a3c5a4b-fc1a-4aa7-a2a9-b9d798597967','dilan','roze'),
('d587632a-8699-4298-a5e2-39ff5ca55ae8','ae0556f5-86b2-4dc5-af22-abf038f0a6c9','rudy','buono'),
('bbe5b4ae-f716-440e-a107-68dccf893a1e','332d57ee-ecbd-4cc1-b02e-be910795b9df','kisan','santoso'),
('44069884-79fd-482b-92b3-c358a0ce4f06','8a54ad93-c6d4-4fd1-a9a4-0787e1a60165','rasyid','wibawa'),
('f887305b-7be3-4f70-852e-3872543fef00','edb35f25-1cf9-4666-b1bd-7cf31d18c177','lintang','kusuma'),
('041226af-ccd9-429c-96c9-45a143198816','eed91a4b-92f8-413f-833c-23987b465471','muhammad','faizar'),
('5e326f61-0be9-4423-852d-457c5687da14','a3253547-ce97-4563-b611-617b7d5747f7','rahadian','putra'),
('eaa8d0b3-e786-4de3-bb26-83525caf420d','683bf78d-7ff6-460a-916b-b01e12e645d3','hanifah','syahfitri'),
('938eb8b4-4dce-42c5-bd35-04b3c47b2b21','7de1433c-33f1-4dbe-9946-f1f289262a11','andika','fadhil'),
('f176eb9f-951a-4d61-9cdb-ca33e98fedda','699cce6a-4aed-4a2f-b726-4f2a4cde7fcf','budi','santoso')
;

INSERT INTO transaction_type(transaction_type_description)
VALUES
('Withdraw'),
('Deposit')
;

INSERT INTO transaction(account_id,transaction_type_id,amount)
VALUES
('4a3c5a4b-fc1a-4aa7-a2a9-b9d798597967',1,50000),
('ae0556f5-86b2-4dc5-af22-abf038f0a6c9',2,40000),
('332d57ee-ecbd-4cc1-b02e-be910795b9df',1,30000),
('8a54ad93-c6d4-4fd1-a9a4-0787e1a60165',2,40000),
('edb35f25-1cf9-4666-b1bd-7cf31d18c177',1,50000),
('332d57ee-ecbd-4cc1-b02e-be910795b9df',2,90000),
('8a54ad93-c6d4-4fd1-a9a4-0787e1a60165',1,70000),
('edb35f25-1cf9-4666-b1bd-7cf31d18c177',2,30000),
('eed91a4b-92f8-413f-833c-23987b465471',1,10000),
('a3253547-ce97-4563-b611-617b7d5747f7',2,50000),
('683bf78d-7ff6-460a-916b-b01e12e645d3',1,60000),
('ae0556f5-86b2-4dc5-af22-abf038f0a6c9',2,60000),
('332d57ee-ecbd-4cc1-b02e-be910795b9df',1,20000),
('8a54ad93-c6d4-4fd1-a9a4-0787e1a60165',1,40000),
('edb35f25-1cf9-4666-b1bd-7cf31d18c177',1,30000),
('a3253547-ce97-4563-b611-617b7d5747f7',1,50000),
('683bf78d-7ff6-460a-916b-b01e12e645d3',2,70000),
('7de1433c-33f1-4dbe-9946-f1f289262a11',2,75000),
('699cce6a-4aed-4a2f-b726-4f2a4cde7fcf',2,89000),
('332d57ee-ecbd-4cc1-b02e-be910795b9df',2,10000),
('8a54ad93-c6d4-4fd1-a9a4-0787e1a60165',2,30000),
('edb35f25-1cf9-4666-b1bd-7cf31d18c177',2,40000),
('eed91a4b-92f8-413f-833c-23987b465471',2,50000),
('a3253547-ce97-4563-b611-617b7d5747f7',2,60000),
('683bf78d-7ff6-460a-916b-b01e12e645d3',2,60000),
('7de1433c-33f1-4dbe-9946-f1f289262a11',1,60000)
;