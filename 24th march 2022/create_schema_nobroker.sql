DROP SCHEMA IF EXISTS nobroker CASCADE;

CREATE SCHEMA nobroker AUTHORIZATION postgres;

-- nobroker."area" definition

-- Drop table

-- DROP TABLE nobroker."area";

CREATE TABLE nobroker."area" (
	area_id int8 NOT NULL,
	area_name varchar(255) NOT NULL,
	latitude varchar(255) NOT NULL,
	longitude varchar(255) NOT NULL,
	radius float8 NOT NULL,
	CONSTRAINT area_pkey PRIMARY KEY (area_id)
);

-- nobroker.address definition

-- Drop table

-- DROP TABLE nobroker.address;

CREATE TABLE nobroker.address (
	address_id int8 NOT NULL,
	area_id int8 NOT NULL,
	addressline1 varchar(255) NOT NULL,
	addressline2 varchar(255) NOT NULL,
	addressline3 varchar(255) NOT NULL,
	addressline4 varchar(255) NOT NULL,
	city varchar(255) NOT NULL,
	state varchar(255) NOT NULL,
	pincode varchar(255) NOT NULL,
	landmark varchar(255) NULL,
	CONSTRAINT address_pkey PRIMARY KEY (address_id),
	CONSTRAINT address_area_id_fkey FOREIGN KEY (area_id) REFERENCES nobroker."area"(area_id)
);

-- nobroker.charge_category definition

-- Drop table

-- DROP TABLE nobroker.charge_category;

CREATE TABLE nobroker.charge_category (
	charge_category_id int8 NOT NULL,
	category varchar(100) NOT NULL,
	CONSTRAINT charge_category_pkey PRIMARY KEY (charge_category_id)
);

-- nobroker.listingcriteria_type definition

-- Drop table

-- DROP TABLE nobroker.listingcriteria_type;

CREATE TABLE nobroker.listingcriteria_type (
	listingcriteriatype_id int8 NOT NULL,
	listing_criteria_type varchar(100) NOT NULL,
	value varchar NOT NULL,
	CONSTRAINT listingcriteriatype_id_pkey PRIMARY KEY (listingcriteriatype_id)
);


-- nobroker.nearby_type definition

-- Drop table

-- DROP TABLE nobroker.nearby_type;

CREATE TABLE nobroker.nearby_type (
	nearby_type_id int8 NOT NULL,
	"type" varchar(255) NOT NULL,
	CONSTRAINT nearby_type_pkey PRIMARY KEY (nearby_type_id)
);


-- nobroker.propertysize definition

-- Drop table

-- DROP TABLE nobroker.propertysize;

CREATE TABLE nobroker.propertysize (
	propertysize_id int8 NOT NULL,
	title varchar(100) NOT NULL,
	built_up_area varchar(100) NOT NULL,
	carpet_area varchar(100) NOT NULL,
	CONSTRAINT propertysize_pkey PRIMARY KEY (propertysize_id)
);

-- nobroker."role" definition

-- Drop table

-- DROP TABLE nobroker."role";

CREATE TABLE nobroker."role" (
	role_id int8 NOT NULL,
	role_name varchar(100) NOT NULL,
	CONSTRAINT role_pkey PRIMARY KEY (role_id)
);


-- nobroker.nearby_spots definition

-- Drop table

-- DROP TABLE nobroker.nearby_spots;

CREATE TABLE nobroker.nearby_spots (
	nearby_spots_id int8 NOT NULL,
	"name" varchar(255) NOT NULL,
	nearby_type_id int8 NOT NULL,
	area_id int8 NOT NULL,
	CONSTRAINT nearby_spots_area_id_fkey FOREIGN KEY (area_id) REFERENCES nobroker."area"(area_id),
	CONSTRAINT nearby_spots_nearby_type_id_fkey FOREIGN KEY (nearby_type_id) REFERENCES nobroker.nearby_type(nearby_type_id)
);


-- nobroker."user" definition

-- Drop table

-- DROP TABLE nobroker."user";

CREATE TABLE nobroker."user" (
	userunique_id int8 NOT NULL,
	role_id int8 NOT NULL,
	user_password varchar(50) NOT NULL,
	auth_token varchar(255) NOT NULL,
	expired bool NOT NULL,
	CONSTRAINT user_pkey PRIMARY KEY (userunique_id),
	CONSTRAINT user_role_id_fkey FOREIGN KEY (role_id) REFERENCES nobroker."role"(role_id)
);

-- nobroker.property definition

-- Drop table

-- DROP TABLE nobroker.property;

CREATE TABLE nobroker.property (
	property_id int8 NOT NULL,
	property_description varchar(255) NOT NULL,
	userunique_id int8 NOT NULL,
	propertysize_id int8 NOT NULL,
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
	CONSTRAINT property_pkey PRIMARY KEY (property_id),
	CONSTRAINT property_propertysize_id_fkey FOREIGN KEY (propertysize_id) REFERENCES nobroker.propertysize(propertysize_id),
	CONSTRAINT property_userunique_id_fkey FOREIGN KEY (userunique_id) REFERENCES nobroker."user"(userunique_id)
);

-- nobroker.property_address definition

-- Drop table

-- DROP TABLE nobroker.property_address;

CREATE TABLE nobroker.property_address (
	propertyaddress_id int8 NOT NULL,
	property_name varchar(100) NOT NULL,
	property_id int8 NOT NULL,
	address_id int8 NOT NULL,
	CONSTRAINT property_address_pkey PRIMARY KEY (propertyaddress_id),
	CONSTRAINT property_address_address_id_fkey FOREIGN KEY (address_id) REFERENCES nobroker.address(address_id),
	CONSTRAINT property_address_property_id_fkey FOREIGN KEY (property_id) REFERENCES nobroker.property(property_id)
);

-- nobroker.property_listing definition

-- Drop table

-- DROP TABLE nobroker.property_listing;

CREATE TABLE nobroker.property_listing (
	propertylisting_id int8 NOT NULL,
	title varchar(100) NOT NULL,
	propertylisting_type varchar(100) NOT NULL,
	property_id int8 NOT NULL,
	CONSTRAINT property_listing_pkey PRIMARY KEY (propertylisting_id),
	CONSTRAINT property_listing_property_id_fkey FOREIGN KEY (property_id) REFERENCES nobroker.property(property_id)
);

-- nobroker.listing_charge definition

-- Drop table

-- DROP TABLE nobroker.listing_charge;

CREATE TABLE nobroker.listing_charge (
	listing_charge_id int8 NOT NULL,
	propertylisting_id int8 NOT NULL,
	charge_category_id int8 NOT NULL,
	amount double precision NOT NULL,
	CONSTRAINT listing_charge_charge_category_id_fkey FOREIGN KEY (charge_category_id) REFERENCES nobroker.charge_category(charge_category_id),
	CONSTRAINT listing_charge_propertylisting_id_fkey FOREIGN KEY (propertylisting_id) REFERENCES nobroker.property_listing(propertylisting_id)
);

-- nobroker.listing_criteria definition

-- Drop table

-- DROP TABLE nobroker.listing_criteria;

CREATE TABLE nobroker.listing_criteria (
	listing_criteria_id int8 NOT NULL,
	listingcriteriatype_id int8 NOT NULL,
	title varchar(100) NOT NULL,
	propertylisting_type varchar(100) NOT NULL,
	propertylisting_id int8 NOT NULL,
	CONSTRAINT listing_criteria_pkey PRIMARY KEY (listing_criteria_id),
	CONSTRAINT listing_criteria_propertylisting_id_fkey FOREIGN KEY (propertylisting_id) REFERENCES nobroker.property_listing(propertylisting_id),
	CONSTRAINT listing_listingcriteriatype_fkey FOREIGN KEY (listingcriteriatype_id) REFERENCES nobroker.listingcriteria_type(listingcriteriatype_id)
);
