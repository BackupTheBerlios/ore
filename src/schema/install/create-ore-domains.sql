-- ORE/Open Rating Environment - $Id: create-ore-domains.sql,v 1.3 2004/12/21 12:17:38 skandalfo Exp $
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

-- Type aliasing domains.
CREATE DOMAIN ore_id BIGINT;
CREATE DOMAIN ore_timestamp TIMESTAMP WITH TIME ZONE;
CREATE DOMAIN ore_name VARCHAR(32);
CREATE DOMAIN ore_display_name TEXT;
CREATE DOMAIN ore_description TEXT;
CREATE DOMAIN ore_boolean BOOLEAN;

-- Enumeration domains.
CREATE DOMAIN ore_definition_level INTEGER CHECK (
	VALUE IN (
		10,	-- All Accounts level.
		20,	-- All Services level.
		21,	-- Specific Service level.
		30,	-- All Products level.
		31,	-- Specific Product level.
		41	-- Specific Structure Type level.
	)
);

CREATE DOMAIN ore_assignment_level INTEGER CHECK (
	VALUE IN (
		10,	-- All Accounts level.
		11,	-- Specific Account level.
		20,	-- All Services level.
		21,	-- Specific Service level.
		22,	-- Specific Service Subscription level.
		30,	-- All Products level.
		31,	-- Specific Product level.
		32,	-- Specific Product Subscription level.
		41	-- Specific Structure Type level.
	)
);
