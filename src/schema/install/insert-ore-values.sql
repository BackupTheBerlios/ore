-- ORE/Open Rating Environment - $Id: insert-ore-values.sql,v 1.1 2004/12/21 12:17:38 skandalfo Exp $
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

INSERT INTO data_type (id, platform_name, display_name, description)
	VALUES (-1, 'integer', 'Integer', 'An integer numeric value.');

INSERT INTO data_type (id, platform_name, display_name, description)
	VALUES (-2, 'double', 'Double', 'A double-precision floating point value.');

INSERT INTO data_type (id, platform_name, display_name, description)
	VALUES (-3, 'decimal', 'Decimal', 'A decimal-precision numeric value.');

INSERT INTO data_type (id, platform_name, display_name, description)
	VALUES (-4, 'id', 'Identifier', 'An integer used to store the identifier for some entity.');

INSERT INTO data_type (id, platform_name, display_name, description)
	VALUES (-5, 'boolean', 'Boolean', 'A boolean value, 0 for false, 1 for true.');

INSERT INTO data_type (id, platform_name, display_name, description)
	VALUES (-6, 'datetime', 'Date-Time', 'A millisecond-precision, UTC-relative timestamp value.');
