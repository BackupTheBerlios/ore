-- ORE/Open Rating Environment - $Id: drop-ore-domains.sql,v 1.5 2004/12/22 21:33:22 skandalfo Exp $
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
DROP DOMAIN ore_id;
DROP DOMAIN ore_timestamp;
DROP DOMAIN ore_name;
DROP DOMAIN ore_display_name;
DROP DOMAIN ore_description;
DROP DOMAIN ore_boolean;
DROP DOMAIN ore_int;
-- Enumeration domains.
DROP DOMAIN ore_definition_level;
DROP DOMAIN ore_assignment_level;
DROP DOMAIN ore_reference_level;
