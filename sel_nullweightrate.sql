/*
������� ��������� ��������� � 0 ����� �� �������� ��������
������������ ��� ������������ �������� �������� ���������

sel_nullweightrate.sql
*/

select * from shiftreportsadv
    where taskdate between to_date('01.03.2022', 'dd.mm.yyyy') and to_date('17.03.2022', 'dd.mm.yyyy')
        --and tripnumbermanual is null
        and weightrate = 0