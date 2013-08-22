# $Id: mysql.sql 51 2007-04-02 01:46:04Z jeff $
#
# Authors:
#      Jeff Buchbinder <jeff@freemedsoftware.org>
#
# FreeMED Electronic Medical Record and Practice Management System
# Copyright (C) 1999-2013 FreeMED Software Foundation
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

#
#	"In Queue" for iMedX transcriptions
#

CREATE TABLE hl7_inqueue_iMedX (
	hl7_timestamp		TIMESTAMP (16) DEFAULT NOW(),
	hl7_provider		VARCHAR (100) NOT NULL,
	hl7_patient		VARCHAR (100) NOT NULL,
	hl7_source		VARCHAR (100) DEFAULT 'iMedX',
	hl7_raw			BLOB,
	hl7_id			VARCHAR(150) NOT NULL,
	processed		BOOL NOT NULL DEFAULT FALSE,
	id			SERIAL,

	PRIMARY KEY		( id )
) ENGINE=InnoDB;

CREATE TABLE hl7_lookup_provider (
	hl7_provider		VARCHAR (100) NOT NULL,
	hl7_source		VARCHAR (100) NOT NULL,
	provider_id		INT UNSIGNED NOT NULL DEFAULT 0,
	id			SERIAL,

	PRIMARY KEY		( id ),
	KEY			( hl7_provider, hl7_source )
) ENGINE=InnoDB;

CREATE TABLE hl7_log (
	stamp			TIMESTAMP (14) DEFAULT NOW(),
	level			ENUM ('info', 'warn', 'error' ) NOT NULL DEFAULT 'info',
	msg TEXT,
	id SERIAL
) ENGINE=InnoDB;

