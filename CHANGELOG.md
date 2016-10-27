#PWAnalytics Changelog

##1.3.1 (Thursday, October 27th, 2016)
 * Consolidate dev, stage and prod.
 * Remove upexpected logs.
 
##1.3.0 (Friday, September 25th, 2015)
 * Adding support for PWCore v2.0.0
 * Updated internal networking interfaces

##1.2.4 (Monday, November 3rd, 2014)
 * Adding encryption support

##1.2.3 (Tuesday, April 22nd, 2014)
 * Fixing possible race condition when flushing cached events

##1.2.2 (Wednesday, March 26th, 2014)
 * Adding arm64 support

##1.2.1 (Thursday, March 20th, 2014)
 * Fixed potential crash when using timed analytics

##1.2.0 (Wednesday, November 6th, 2013)
 * Added namespace parameter to analytics methods to allow custom namespace support that will enable custom events processing.
 * Session event optimizations. No longer sending a SESSION_STOP event.

##1.1.2 (Monday, November 4th, 2013)
 * Updated SDK to REMOVE alphanumeric event and event key/value requirement
 * Added additional validation to analytics payloads to prevent sending bad data

##1.1.1 (Friday, August 16th, 2013)
 * Updated SDK with alphanumeric event and event key/value requirement

##1.1.0 (Monday, July 1st 2013)
 * Added ability to pause and resume timed analytic events

##1.0.0 (Friday, June 30th, 2013)
 * Initial release