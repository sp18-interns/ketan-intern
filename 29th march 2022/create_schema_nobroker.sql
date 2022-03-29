DROP SCHEMA IF EXISTS nobroker CASCADE;

CREATE SCHEMA nobroker AUTHORIZATION postgres;


-- nobroker."user" definition

-- Drop table

-- DROP TABLE nobroker."user";

CREATE TABLE nobroker."user" (
	userunique_id int8 NOT NULL,
	role varchar (100) NOT NULL,
	user_password varchar(50) NOT NULL,
	auth_token varchar(255) NOT NULL,
	expired bool NOT NULL,
	user_name varchar(100) NOT NULL,
	CONSTRAINT user_pkey PRIMARY KEY (userunique_id)
);

-- nobroker.property definition

-- Drop table

-- DROP TABLE nobroker.property;

CREATE TABLE nobroker.property (
	property_id int8 NOT NULL,
	property_description varchar(255) NOT NULL,
	userunique_id int8 NOT NULL,
	phone_number float8 NOT NULL,
	availability varchar(100) NOT NULL,
	is_furnished bool NOT NULL,
	entrance_direction varchar(100) NOT NULL,
	ready_to_move bool NOT NULL,
	has_parking bool NOT NULL,
	floor_no int8 NOT NULL,
	no_of_balconies int8 NOT NULL,
	age_of_property int8 NOT NULL,
	water_supply_timing varchar(100) NOT NULL,
	listing_date time unique NOT NULL,
	built_area varchar (100) NOT NULL,
	carpet_area varchar (100) NOT NULL,
	CONSTRAINT property_pkey PRIMARY KEY (property_id),
	CONSTRAINT userunique_id_fkey FOREIGN KEY (userunique_id) REFERENCES nobroker."user"(userunique_id)
);

CREATE TABLE nobroker.property_details (
	property_details_id int8 NOT NULL,
	property_id int8 NOT NULL,
	property_details_type varchar(100) NOT NULL,
	charge_category varchar NOT NULL,
	amount double precision NOT NULL,
	CONSTRAINT property_details_id_pkey PRIMARY KEY (property_details_id),
	CONSTRAINT property_details_property_id_fkey FOREIGN KEY (property_id) REFERENCES nobroker.property(property_id)
);


-- nobroker.property_address definition

-- Drop table

-- DROP TABLE nobroker.property_address;

CREATE TABLE nobroker.property_address (
	property_address_id int8 NOT NULL,
	property_area varchar(255) NOT NULL,
	property_id int8 NOT NULL,
	addressline1 varchar(255) NOT NULL,
	addressline2 varchar(255) NOT NULL,
	addressline3 varchar(255) NOT NULL,
	addressline4 varchar(255) NOT NULL,
	city varchar(255) NOT NULL,
	state varchar(255) NOT NULL,
	pincode varchar(255) NOT NULL,
	landmark varchar(255) NULL,
	CONSTRAINT property_address_pkey PRIMARY KEY (property_address_id),
	CONSTRAINT property_address_property_id_fkey FOREIGN KEY (property_id) REFERENCES nobroker.property(property_id)
);

CREATE TABLE nobroker.property_media (
	property_media_id int8 NOT NULL,
	property_id int8 NOT NULL,
	media_category varchar NOT NULL,
	CONSTRAINT property_media_property_id_fkey FOREIGN KEY (property_id) REFERENCES nobroker.property(property_id)
);

CREATE TABLE nobroker.user_wishlist (
	user_wishlist_id int8 NOT NULL,
	property_id int8 NOT NULL,
	userunique_id int8 NOT NULL,
	CONSTRAINT user_wishlist_property_id_fkey FOREIGN KEY (property_id) REFERENCES nobroker.property(property_id),
	CONSTRAINT user_wishlist_userunique_id_fkey FOREIGN KEY (userunique_id) REFERENCES nobroker."user"(userunique_id)
);

















