/*
sel_drivers_new.sql
������� �� ���������� ������ ���������, ����������� � ����������� �������, ��� ������� � 1� GUID
*/

select sel1.* from(
select dr.tabelnum, dr.famname || ' ' || dr.firstname || ' ' || dr.secname as FIO, '����������' as TypeTS
    from dispatcher.shovdrivers dr
union
select dr.tabelnum, dr.famname || ' ' || dr.firstname || ' ' || dr.secname as FIO, '���������' as TypeTS
    from dispatcher.auxdrivers dr
union
select dr.tabelnum, dr.famname || ' ' || dr.firstname || ' ' || dr.secname as FIO, '��������' as TypeTS
    from dispatcher.drivers dr
) sel1
where tabelnum in (23277, 23204,23213,23211,23201,23228,23229,23282,22970,22926)