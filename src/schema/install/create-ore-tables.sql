-- ORE/Open Rating Environment - $Id: create-ore-tables.sql,v 1.7 2004/12/21 12:17:38 skandalfo Exp $
-- Copyright (C) 2004 Juan J. Garcia de Soria.
-- 
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2.1 of the License, or (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
-- 
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-- 
-- ((autolicense)) 

CREATE TABLE catalog (
	id			ore_id NOT NULL DEFAULT NEXTVAL('catalog_id_seq'),
	parent_id		ore_id REFERENCES catalog(id),
	platform_name		ore_name NOT NULL UNIQUE,
	display_name		ore_display_name NOT NULL,
	description		ore_description NOT NULL,
	availability_date	ore_timestamp,
	retirement_date		ore_timestamp,
	PRIMARY KEY(id)
);

CREATE TABLE account (
	id			ore_id NOT NULL DEFAULT NEXTVAL('account_id_seq'),
	parent_id		ore_id REFERENCES account(id),
	creation_date		ore_timestamp NOT NULL,
	deletion_date		ore_timestamp,
	catalog_id		ore_id REFERENCES catalog(id),
	PRIMARY KEY(id)
);

CREATE TABLE product (
	id			ore_id NOT NULL DEFAULT NEXTVAL('product_id_seq'),
	parent_id		ore_id REFERENCES product(id),
	platform_name		ore_name NOT NULL UNIQUE,
	display_name		ore_display_name NOT NULL,
	description		ore_description NOT NULL,
	availability_date	ore_timestamp,
	retirement_date		ore_timestamp,
	PRIMARY KEY(id)
);

CREATE TABLE service (
	id			ore_id NOT NULL DEFAULT NEXTVAL('service_id_seq'),
	parent_id		ore_id REFERENCES service(id),
	platform_name		ore_name NOT NULL UNIQUE,
	display_name		ore_display_name NOT NULL,
	description		ore_description NOT NULL,
	availability_date	ore_timestamp,
	retirement_date		ore_timestamp,
	PRIMARY KEY(id)
);

CREATE TABLE product_has_service (
	product_id		ore_id NOT NULL REFERENCES product(id),
	service_id		ore_id NOT NULL REFERENCES service(id),
	PRIMARY KEY(product_id, service_id)
);

CREATE TABLE product_subscription (
	id			ore_id NOT NULL DEFAULT NEXTVAL('product_subscription_id_seq'),
	product_id		ore_id NOT NULL REFERENCES product(id),
	account_id		ore_id NOT NULL REFERENCES account(id),
	subscription_date	ore_timestamp,
	termination_date	ore_timestamp,
	PRIMARY KEY(id)
);

CREATE TABLE service_subscription (
	id			ore_id NOT NULL DEFAULT NEXTVAL('service_subscription_id_seq'),
	service_id		ore_id NOT NULL REFERENCES service(id),
	product_subscription_id	ore_id NOT NULL	REFERENCES product_subscription(id),
	PRIMARY KEY(id)
);

CREATE TABLE data_type (
	id			ore_id NOT NULL DEFAULT NEXTVAL('data_type_id_seq'),
	platform_name		ore_name NOT NULL UNIQUE,
	display_name		ore_display_name NOT NULL,
	description		ore_description NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE parameter (
	id			ore_id NOT NULL DEFAULT NEXTVAL('parameter_id_seq'),
	platform_name		ore_name NOT NULL UNIQUE,
	display_name		ore_display_name NOT NULL,
	description		ore_description NOT NULL,
	defining_level		ore_definition_level NOT NULL,
	defining_entity		ore_id,	-- REFERENCES whatever_table(id)
	data_type_id		ore_id REFERENCES data_type(id) NOT NULL,
	is_array		ore_boolean NOT NULL,
	value_required		ore_boolean NOT NULL,
	value_unique		ore_boolean NOT NULL,
	value_historical	ore_boolean NOT NULL,
	PRIMARY KEY(id)
);

