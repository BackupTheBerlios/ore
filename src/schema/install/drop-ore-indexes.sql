-- ORE/Open Rating Environment - $Id: drop-ore-indexes.sql,v 1.2 2004/12/21 12:17:38 skandalfo Exp $
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
DROP INDEX catalog_parent_id_idx;

DROP INDEX account_creation_date_idx;
DROP INDEX account_deletion_date_idx;

DROP INDEX product_parent_id_idx;

DROP INDEX service_parent_id_idx;

DROP INDEX product_subscription_product_id_idx;
DROP INDEX product_subscription_account_id_idx;

DROP INDEX product_subscription_subscription_date_idx;
DROP INDEX product_subscription_termination_date_idx;

DROP INDEX service_subscription_service_id_idx;
DROP INDEX service_subscription_product_subscription_id_idx;

DROP INDEX parameter_defining_place_idx;
DROP INDEX parameter_data_type_id_idx;

