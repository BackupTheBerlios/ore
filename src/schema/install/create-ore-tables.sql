-- ORE/Open Rating Environment - $Id: create-ore-tables.sql,v 1.3 2004/12/20 20:41:28 skandalfo Exp $
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

CREATE TABLE account (
	id			BIGINT NOT NULL,
	creation_date		TIMESTAMP WITH TIME ZONE NOT NULL,
	deletion_date		TIMESTAMP WITH TIME ZONE,
	PRIMARY KEY(id)
);

CREATE TABLE product (
	id			BIGINT NOT NULL,
	parent_id		BIGINT REFERENCES product(id),
	platform_name		TEXT NOT NULL,
	display_name		TEXT NOT NULL,
	description		TEXT NOT NULL,
	availability_date	TIMESTAMP WITH TIME ZONE,
	PRIMARY KEY(id)
);

CREATE TABLE service (
	id			BIGINT NOT NULL,
	parent_id		BIGINT REFERENCES service(id),
	platform_name		TEXT NOT NULL,
	display_name		TEXT NOT NULL,
	description		TEXT NOT NULL,
	availability_date	TIMESTAMP WITH TIME ZONE,
	PRIMARY KEY(id)
);

CREATE TABLE product_has_service (
	product_id		BIGINT NOT NULL REFERENCES product(id),
	service_id		BIGINT NOT NULL REFERENCES service(id),
	PRIMARY KEY(product_id, service_id)
);

CREATE TABLE product_subscription (
	id			BIGINT NOT NULL,
	product_id		BIGINT NOT NULL REFERENCES product(id),
	account_id		BIGINT NOT NULL REFERENCES account(id),
	subscription_date	TIMESTAMP WITH TIME ZONE,
	termination_date	TIMESTAMP WITH TIME ZONE,
	PRIMARY KEY(id)
);

CREATE TABLE service_subscription (
	id			BIGINT NOT NULL,
	service_id		BIGINT NOT NULL REFERENCES service(id),
	product_subscription_id	BIGINT NOT NULL	REFERENCES product_subscription(id),
	PRIMARY KEY(id)
);

