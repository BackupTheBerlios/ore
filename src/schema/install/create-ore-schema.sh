#!/bin/sh
# ORE/Open Rating Environment - $Id: create-ore-schema.sh,v 1.2 2004/12/20 22:58:07 skandalfo Exp $
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
psql template1 postgres -f create-ore-user.sql
psql template1 postgres -f create-ore-database.sql
psql ore ore -f create-ore-domains.sql
psql ore ore -f create-ore-tables.sql
psql ore ore -f create-ore-sequences.sql

