-- $Id$

drop view if exists cm_google;
drop view if exists cm_yahoo;
drop view if exists cm_bing;
drop view if exists cm_youtube;
drop view if exists cm_facebook;
drop view if exists cm_ask;

drop view if exists changemon_ts;

create view changemon_ts as
  select strftime('%Y-%m-%d %H:%M:%S', ts/1000, 'unixepoch', 'localtime') || '.' || ( + ts % 1000) as ts,
         engine, what, attr, oldv, newv, id, proto, host, path, query, doc, note
  from changemon cm
  order by cm.ts desc;

create view cm_google   as select * from changemon_ts where engine = 'google';
create view cm_yahoo    as select * from changemon_ts where engine = 'yahoo';
create view cm_bing     as select * from changemon_ts where engine = 'bing';
create view cm_youtube  as select * from changemon_ts where engine = 'youtube';
create view cm_facebook as select * from changemon_ts where engine = 'facebook';
create view cm_ask      as select * from changemon_ts where engine = 'ask';
