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
(0, 'gender', 'male'),
(1, 'gender', 'female'),
(2, 'room', 'single'),
(3, 'room', 'double'),
(4, 'room', 'triple'),
(5, 'room', 'four'),
(6, 'room', 'four+'),
(7, 'tenanttype', 'rent'),
(8, 'tenanttype', 'pg'),
(9, 'tenanttype', 'flatmates'),
(10, 'tenanttype', 'hostel');

INSERT INTO nobroker.nearby_type
(nearby_type_id, "type")
(0, 'hospital'),
(1, 'railway'),
(2, 'restaurant'),
(3, 'bank');

INSERT INTO nobroker.area
(area_id, area_name, latitude, longitude, radius)
VALUES
(0, 'Kopar Khairane', '19.102769', '73.009001', 5.5),
(0, 'Vashi', '19.0745', '72.9978', 5.5),
(0, 'Rabale', '19.1463', '73.0081', 5.5),
(0, 'Airoli', '19.1590', '72.9986', 5.5);




