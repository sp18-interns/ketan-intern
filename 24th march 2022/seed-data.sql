-- seed data for role

INSERT INTO nobroker."role"
(role_id, role_name)
VALUES
(1, 'Owner'),
(2, 'Tenant');

--select * from nobroker.role ;

INSERT INTO nobroker.listingcriteria_type
(listingcriteriatype_id, listing_criteria_type, value)
VALUES
(1, 'gender', 'male'),
(2, 'gender', 'female'),
(3, 'room', 'single'),
(4, 'room', 'double'),
(5, 'room', 'triple'),
(6, 'room', 'four'),
(7, 'room', 'four+'),
(8, 'tenanttype', 'rent'),
(9, 'tenanttype', 'pg'),
(10, 'tenanttype', 'flatmates'),
(11, 'tenanttype', 'hostel');

INSERT INTO nobroker.nearby_type
(nearby_type_id, "type")
VALUES 
(1, 'hospital'),
(2, 'railway'),
(3, 'restaurant'),
(4, 'bank');

INSERT INTO nobroker.area
(area_id, area_name, latitude, longitude, radius)
VALUES
(1, 'Kopar Khairane', '19.102769', '73.009001', 5.5),
(2, 'Vashi', '19.0745', '72.9978', 5.6),
(3, 'Rabale', '19.1463', '73.0081', 5.7),
(4, 'Airoli', '19.1590', '72.9986', 5.8);




