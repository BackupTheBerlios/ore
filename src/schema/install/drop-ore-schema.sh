#!/bin/sh
# ORE/Open Rating Environment - $Id: drop-ore-schema.sh,v 1.3 2004/12/21 10:17:51 skandalfo Exp $
# Copyright (C) 2004 Juan J. Garcia de Soria.
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
# 
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# 
# ((autolicense)) 
psql ore ore -f drop-ore-indexes.sql
psql ore ore -f drop-ore-tables.sql
psql ore ore -f drop-ore-sequences.sql
psql ore ore -f drop-ore-domains.sql
psql template1 postgres -f drop-ore-database.sql
psql template1 postgres -f drop-ore-user.sql

