CREATE TABLE users ( 
	id                   varchar(36) NOT NULL  PRIMARY KEY  ,
	full_name            varchar(190) NOT NULL    ,
	username             varchar(150)     ,
	password_hash        varchar(200)     ,
	is_excluded          boolean  DEFAULT false   ,
	created_at           datetime  DEFAULT CURRENT_TIMESTAMP   ,
	updated_at           datetime  DEFAULT CURRENT_TIMESTAMP   ,
	CONSTRAINT idx_users_unq_username UNIQUE ( username ) 
 );

CREATE TABLE tasks ( 
	id                   varchar(36) NOT NULL  PRIMARY KEY  ,
	title                varchar(90) NOT NULL    ,
	description          varchar(8192)     ,
	is_action_needed     boolean     ,
	position             varchar(10)  DEFAULT 'IDLE'   ,
	is_project           boolean  DEFAULT false   ,
	project_id           varchar(36)     ,
	complete_in          date     ,
	user_id              varchar(36)     ,
	done                 boolean  DEFAULT false   ,
	created_at           datetime  DEFAULT CURRENT_TIMESTAMP   ,
	updated_at           datetime  DEFAULT CURRENT_TIMESTAMP   
 );

BEGIN TRANSACTION;

PRAGMA writable_schema = 1;

UPDATE SQLITE_MASTER SET SQL = 'CREATE TABLE tasks ( 
	id                   varchar(36) NOT NULL  PRIMARY KEY  ,
	title                varchar(90) NOT NULL    ,
	description          varchar(8192)     ,
	is_action_needed     boolean     ,
	position             varchar(10)  DEFAULT 'IDLE'   ,
	is_project           boolean  DEFAULT false   ,
	project_id           varchar(36)     ,
	complete_in          date     ,
	user_id              varchar(36)     ,
	done                 boolean  DEFAULT false   ,
	created_at           datetime  DEFAULT CURRENT_TIMESTAMP   ,
	updated_at           datetime  DEFAULT CURRENT_TIMESTAMP   ,
	FOREIGN KEY ( user_id ) REFERENCES users( id ) ON DELETE RESTRICT ON UPDATE RESTRICT,
	FOREIGN KEY ( project_id ) REFERENCES tasks( id )  
 ) ' WHERE NAME='tasks';

PRAGMA writable_schema = 1;

END TRANSACTION;

BEGIN TRANSACTION;

PRAGMA writable_schema = 1;

UPDATE SQLITE_MASTER SET SQL = 'CREATE TABLE tasks ( 
	id                   varchar(36) NOT NULL  PRIMARY KEY  ,
	title                varchar(90) NOT NULL    ,
	description          varchar(8192)     ,
	is_action_needed     boolean     ,
	position             varchar(10)  DEFAULT 'IDLE'   ,
	is_project           boolean  DEFAULT false   ,
	project_id           varchar(36)     ,
	complete_in          date     ,
	user_id              varchar(36)     ,
	done                 boolean  DEFAULT false   ,
	created_at           datetime  DEFAULT CURRENT_TIMESTAMP   ,
	updated_at           datetime  DEFAULT CURRENT_TIMESTAMP   ,
	FOREIGN KEY ( project_id ) REFERENCES tasks( id )  
 ) ' WHERE NAME='tasks';

PRAGMA writable_schema = 1;

END TRANSACTION;
