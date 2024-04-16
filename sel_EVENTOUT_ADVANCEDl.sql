 /*CREATE OR REPLACE FORCE VIEW "V_EVENTOUT_ADVANCED" ("MESCOUNTER", "VEHID", "EVENTTIME", "EVENTGMTTIME", "X", "Y", "EVENTGROUP", "EVENTCODE", "EVENTDESCR", "ISOUTDATED", "VEHTYPE", "OCTET", "Z", "GPS_QUALITY", "SYSTEMTIME", "FUEL", "SPEED", "WEIGHT", "RECEIVED") AS 
 
 ������� ��� ����������� ������������
 */
 
 select sel1.*
 , ugh.f_getgeozoneforpoint(sel1.x,sel1.y) as geozone
 from (
  SELECT DISTINCT
           FIRST_VALUE (mescounter)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as mescounter,
           vehid,
           FIRST_VALUE (eventtime)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as eventtime,
           FIRST_VALUE (eventgmttime)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as eventgmttime,
           FIRST_VALUE (eo.x)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as x,
           FIRST_VALUE (eo.y)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as y,
           FIRST_VALUE (eventgroup)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as eventgroup,
           FIRST_VALUE (eventcode)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as eventcode,
           FIRST_VALUE (eventdescr)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as eventdescr,
           FIRST_VALUE (isoutdated)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as isoutdated,
           vehtype,
           FIRST_VALUE (octet)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as octet,
           FIRST_VALUE (eo.z)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as z ,
           FIRST_VALUE (eo.GPS_QUALITY)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as GPS_QUALITY,
           FIRST_VALUE (eo.systemtime)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as systemtime,
           FIRST_VALUE (eo.fuel)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as fuel,
           FIRST_VALUE (eo.speed)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as speed,
           FIRST_VALUE (eo.weight)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as weight,
           FIRST_VALUE (eo.received)
               OVER (PARTITION BY vehid, vehtype ORDER BY eventgmttime DESC) as received
               
      FROM dispatcher.eventout eo
      ) sel1;