/* Création des différentes Tables */

CREATE TABLE admin 
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    email VARCHAR(180) UNIQUE NOT NULL,
    roles json,
    password VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) engine=INNODB;

CREATE TABLE specialite
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
) engine=INNODB;

CREATE TABLE status
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
) engine=INNODB;

CREATE TABLE type_mission
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
) engine=INNODB;

CREATE TABLE mission
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    title VARCHAR(30) NOT NULL,
    description TEXT NOT NULL,
    code_name VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status_id INT,
    FOREIGN KEY (status_id) REFERENCES status (id),
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES type_mission (id),
    speciality_id INT,
    FOREIGN KEY (speciality_id) REFERENCES specialite (id)
) engine=INNODB;

CREATE TABLE contact
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    lastname VARCHAR(255) NOT NULL,
    firstname VARCHAR(255)NOT NULL,
    date_of_birth DATE NOT NULL,
    nationality VARCHAR(255) NOT NULL,
    code_name VARCHAR(255) NOT NULL,
    mission_id INT,
    FOREIGN KEY (mission_id) REFERENCES mission (id)
) engine=INNODB;

CREATE TABLE cible
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    lastname VARCHAR(255) NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    nationality VARCHAR(255) NOT NULL,
    code_name VARCHAR(255) NOT NULL,
    mission_id INT,
    FOREIGN KEY (mission_id) REFERENCES mission (id)
) engine=INNODB;

CREATE TABLE planque
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    code INT NOT NULL,
    address TEXT NOT NULL,
    country VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    mission_id INT NULL,
    FOREIGN KEY (mission_id) REFERENCES mission (id)
) engine=INNODB;

CREATE TABLE agent 
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    lastname VARCHAR(255) NOT NULL,
    firstname VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    identification_code INT(11) NOT NULL,
    nationality VARCHAR(255) NOT NULL,
    mission_id INT,
    FOREIGN KEY (mission_id) REFERENCES mission(id)
) engine=INNODB;

CREATE TABLE agent_specialite
(
    agent_id INT,
    FOREIGN KEY (agent_id) REFERENCES agent (id),
    specialite_id INT,
    FOREIGN KEY (specialite_id) REFERENCES specialite (id)
) engine=INNODB;

/* Insertion des données */
/* Insertion Admin */

insert into admin (id, email, roles, password, lastname, firstname)
values 
(1, 'crisely0@biblegateway.com', '[{}]', '$2y$10$xUrGtFAqnzDwreuNgYn2zuhzQe9nDKQ9OcLr6leB73gEKb6zQqe62', 'Risely', 'Caren'),
(2, 'gcolomb1@usnews.com', '[{}]', '$2y$10$zjzxgvPvYdZ5UfI.lJfMs.b9R./ha03co3UNMsa.A646ARVuzhB0y', 'Colomb', 'Gonzales'),
(3, 'swehnerr2@dailymail.co.uk', '[{}]', '$2y$10$YNnjX/.t2/wqRr5HK.M95uCLRVymsjaa3.BYBCDa8hsMPfcCHmc2K', 'Wehnerr', 'Sayres'),
(4, 'moxnam3@networkadvertising.org', '[{}]', '$2y$10$8wWkAYydoRCHg0mxNgfNvuJCsW4PR5Wm2hvKPgMBR8OQ3vhT6LJgq', 'Oxnam', 'Merlina'),
(5, 'rcarnegie4@stumbleupon.com', '[{}]', '$2y$10$nUwHN83uYU8uQosyaFx9CODUjVLBb6bRVc1R4p07zcsPxO3dqVC8m', 'Carnegie', 'Robinette');


/* Insertion Specialite */

insert into specialite (id, name) 
values 
(1, 'Tir'),
(2, 'Espionnage'),
(3, 'Enlèvement'),
(4, 'Infiltration'),
(5, 'Sabotage');

/* Insertion Statuts */

insert into status (id, name) 
values 
(1, 'En Attente'),
(2, 'En Cours'),
(3, 'Terminée');

/* Insertion Type de Mission */

insert into type_mission (id, name) 
values 
(1, 'Surveillance'),
(2, 'Assassinat'),
(3, 'Infiltration'),
(4, 'Sabotage'),
(5, 'Exfiltration');

/* Insertion Missions */

insert into mission (id, title, description, code_name, country, start_date, end_date, status_id, type_id, speciality_id) 
values 
(1, 'Software Test Engineer IV', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.', 'RuFLEm8', 'China', '2022-09-01', '2022-10-06', 1, 1, 1),
(2, 'Media Manager I', 'Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', 'oGxqcrCJmw', 'France', '2021-08-07', '2022-09-12', 2, 2, 2),
(3, 'Electrical Engineer', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.', 'ArSlw0um', 'Greece', '2020-06-11', '2022-03-22', 3, 3, 3),
(4, 'Help Desk Operator', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 'labThMYOScQV', 'Portugal', '2021-04-05', '2022-07-02', 1, 4, 4),
(5, 'Design Engineer', 'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', '3JfNOigRGCC', 'Philippines', '2021-01-18', '2021-12-10', 2, 5, 5);

/* Insertion Contacts */

insert into contact (id, lastname, firstname, date_of_birth, nationality, code_name, mission_id) 
values 
(1, 'Spuffard', 'Emmey', '2021-07-23', 'Ndebele', 'OgIRt1yBr', 1),
(2, 'Sicily', 'Sigrid', '2022-02-20', 'Armenian', 'KC3wOl0u', 1),
(3, 'Smouten', 'Timmi', '2022-02-01', 'Armenian', '8s5Ozac83Va', 2),
(4, 'Kelso', 'Zebulen', '2021-04-25', 'Malayalam', '0PQDXw', 3),
(5, 'Bidon', 'Zora', '1980-10-06', 'Français', '0DLFO9', 4),
(6, 'Test', 'Zoulou', '1973-10-16', 'Portugais', 'PLDMFw', 5),
(7, 'Sottell', 'Concettina', '2022-12-02', 'Icelandic', 'rpxu3E', 5);

/* Insertion Cibles */

insert into cible (id, firstname, lastname, date_of_birth, nationality, code_name, mission_id) 
values 
(1, 'Filippo', 'Breese', '2021-07-30', 'Bosnian', 'mTkeXpyDf', 1),
(2, 'Cordie', 'Spoerl', '2021-11-13', 'Kazakh', 'P03qWAb', 1),
(3, 'Ernesto', 'Musgrove', '2022-01-14', 'Dzongkha', '6NL0TRb', 3),
(4, 'Fritz', 'Bernli', '2022-10-03', 'Maltese', 'MLGU7KUPk', 4),
(5, 'Dwayne', 'Geall', '2021-05-17', 'New Zealand Sign Language', 'YgLO7Ns17', 5);

/* Insertion Agent */

insert into agent (id, lastname, firstname, date_of_birth, nationality, identification_code, mission_id) 
values 
(1, 'Allred', 'Ivor', '2021-11-01', 'Khmer', 82, 1),
(2, 'Maskew', 'Yancey', '2021-09-11', 'Sotho', 71, 2),
(3, 'Hewes', 'Haily', '2021-02-12', 'Bulgarian', 56, 3),
(4, 'Odell', 'Todd', '2022-01-17', 'Chinese', 86, 3),
(5, 'Droum', 'Sinua', '1990-08-17', 'Français', 76, 4),
(6, 'Farrer', 'Blondell', '2022-07-02', 'Somali', 97, 5);

/* Insertion Liens entre Agents et Spécialités */

insert into agent_specialite (agent_id, specialite_id) 
values 
(1, 2),
(1, 3),
(2, 1),
(3, 4),
(3, 5),
(4, 5),
(5, 1);

/* Insertion Planques */

insert into planque (id, code, address, country, type, mission_id) 
values 
(1, 9, '37 Carey Junction', 'China', 'velit', 1),
(2, 64, '87706 Bobwhite Court', 'Russia', 'quisque', 2),
(3, 50, '41885 Calypso Street', 'Nigeria', 'arcu', 3),
(4, 77, '7 Manley Center', 'Honduras', 'ultrices', 3),
(5, 8, '519 Sherman Lane', 'Philippines', 'semper', 4),
(6, 91, '85809 Oriole Center', 'Netherlands', 'sodales', 5);