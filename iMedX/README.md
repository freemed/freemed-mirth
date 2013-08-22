# IMEDX

[Mirth](http://www.mirthproject.org/) configuration for iMedX transcription service.

## REQUIREMENTS
 * Debian package `php5-cli`
 * Working **FreeMED** installation (0.8.x/0.9.x+ series)
 * Mirth v1.7.3207+ installed in `/opt/mirth/current` (or in /opt/mirth/mirth-(version) symlinked into current)

## INSTALLATION
 * Create a "data store" in `/opt/mirth/datastore`
 * `iMedX.xml` has to installed as a channel in Mirth 
 * Load `mysql.sql` into the MySQL server used for FreeMED

