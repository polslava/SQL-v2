set define '^'
set verify off
set serveroutput on size 1000000
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
 
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to sqlplus as the schema associated with the UI defaults or as the product schema.
  wwv_flow_api.set_security_group_id(p_security_group_id=>1044507037698648);
 
end;
/

begin wwv_flow.g_import_in_progress := true; end;
/
begin 

select value into wwv_flow_api.g_nls_numeric_chars from nls_session_parameters where parameter='NLS_NUMERIC_CHARACTERS';

end;

/
begin execute immediate 'alter session set nls_numeric_characters=''.,''';

end;

/
begin wwv_flow.g_browser_language := 'ru'; end;
/
prompt  Check Compatibility...
 
begin
 
-- This date identifies the minimum version required to install this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2009.01.12');
 
end;
/

-- SET SCHEMA
 
begin
 
   wwv_flow_api.g_id_offset := 0;
   wwv_flow_hint.g_schema   := 'PITE_NEW';
   wwv_flow_hint.check_schema_privs;
 
end;
/

 
--------------------------------------------------------------------
prompt  SCHEMA PITE_NEW - User Interface Defaults
--
-- Import using sqlplus as the Oracle user: APEX_030200
-- Exported 08:31 Среда Июнь 15, 2022 by: DEVELOPER
--
 
begin
 
-- Remove User Interface Defaults
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'V_PEREGRUZ');
 
end;
/

 
begin
 
wwv_flow_hint.create_table_hint_priv(
  p_table_id             => 1123901882073080 + wwv_flow_api.g_id_offset,
  p_schema               => wwv_flow_hint.g_schema,
  p_table_name           => 'V_PEREGRUZ',
  p_report_region_title  => 'V Peregruz',
  p_form_region_title    => 'V Peregruz');
 
end;
/

 
begin
 
-- Remove User Interface Defaults
wwv_flow_hint.remove_hint_priv(wwv_flow_hint.g_schema,'V_TS_MODEL');
 
end;
/

 
begin
 
wwv_flow_hint.create_table_hint_priv(
  p_table_id             => 1321716565848641 + wwv_flow_api.g_id_offset,
  p_schema               => wwv_flow_hint.g_schema,
  p_table_name           => 'V_TS_MODEL',
  p_report_region_title  => 'V Ts Model',
  p_form_region_title    => 'V Ts Model');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_column_id           => 1124000944073109 + wwv_flow_api.g_id_offset,
  p_table_id            => 1123901882073080 + wwv_flow_api.g_id_offset,
  p_column_name         => 'OCOUNTER',
  p_label               => 'Ocounter',
  p_help_text           => '',
  p_mask_form           => '',
  p_display_seq_form    => 1,
  p_display_in_form     => 'Y',
  p_display_as_form     => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report  => 1,
  p_display_in_report   => 'N',
  p_display_as_report   => 'WITHOUT_MODIFICATION',
  p_mask_report         => '',
  p_aggregate_by        => 'N',
  p_lov_query           => '',
  p_default_value       => '',
  p_required            => 'N',
  p_alignment           => 'L',
  p_display_width       => 1,
  p_max_width           => 1,
  p_height              => 1,
  p_group_by            => 'N',
  p_order_by_seq        => null,
  p_order_by_asc_desc   => '',
  p_searchable          => 'Y');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_column_id           => 1124131738073109 + wwv_flow_api.g_id_offset,
  p_table_id            => 1123901882073080 + wwv_flow_api.g_id_offset,
  p_column_name         => 'VTVEHID',
  p_label               => 'Vtvehid',
  p_help_text           => '',
  p_mask_form           => '',
  p_display_seq_form    => 2,
  p_display_in_form     => 'Y',
  p_display_as_form     => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report  => 2,
  p_display_in_report   => 'Y',
  p_display_as_report   => 'WITHOUT_MODIFICATION',
  p_mask_report         => '',
  p_aggregate_by        => 'N',
  p_lov_query           => '',
  p_default_value       => '',
  p_required            => 'N',
  p_alignment           => 'L',
  p_display_width       => 30,
  p_max_width           => 30,
  p_height              => 1,
  p_group_by            => 'N',
  p_order_by_seq        => null,
  p_order_by_asc_desc   => '',
  p_searchable          => 'Y');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_column_id           => 1124227539073110 + wwv_flow_api.g_id_offset,
  p_table_id            => 1123901882073080 + wwv_flow_api.g_id_offset,
  p_column_name         => 'TIMELOAD',
  p_label               => 'Timeload',
  p_help_text           => '',
  p_mask_form           => '',
  p_display_seq_form    => 3,
  p_display_in_form     => 'Y',
  p_display_as_form     => 'PICK_DATE_MM_DD_YYYY',
  p_display_as_tab_form => 'PICK_DATE_MM_DD_YYYY',
  p_display_seq_report  => 3,
  p_display_in_report   => 'Y',
  p_display_as_report   => 'WITHOUT_MODIFICATION',
  p_mask_report         => '',
  p_aggregate_by        => 'N',
  p_lov_query           => '',
  p_default_value       => '',
  p_required            => 'N',
  p_alignment           => 'L',
  p_display_width       => null,
  p_max_width           => null,
  p_height              => null,
  p_group_by            => 'N',
  p_order_by_seq        => null,
  p_order_by_asc_desc   => '',
  p_searchable          => 'N');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_column_id           => 1124331043073110 + wwv_flow_api.g_id_offset,
  p_table_id            => 1123901882073080 + wwv_flow_api.g_id_offset,
  p_column_name         => 'GMTTIMELOAD',
  p_label               => 'Gmttimeload',
  p_help_text           => '',
  p_mask_form           => '',
  p_display_seq_form    => 4,
  p_display_in_form     => 'Y',
  p_display_as_form     => 'PICK_DATE_MM_DD_YYYY',
  p_display_as_tab_form => 'PICK_DATE_MM_DD_YYYY',
  p_display_seq_report  => 4,
  p_display_in_report   => 'Y',
  p_display_as_report   => 'WITHOUT_MODIFICATION',
  p_mask_report         => '',
  p_aggregate_by        => 'N',
  p_lov_query           => '',
  p_default_value       => '',
  p_required            => 'N',
  p_alignment           => 'L',
  p_display_width       => null,
  p_max_width           => null,
  p_height              => null,
  p_group_by            => 'N',
  p_order_by_seq        => null,
  p_order_by_asc_desc   => '',
  p_searchable          => 'N');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_column_id           => 1124415765073110 + wwv_flow_api.g_id_offset,
  p_table_id            => 1123901882073080 + wwv_flow_api.g_id_offset,
  p_column_name         => 'XLOAD',
  p_label               => 'Xload',
  p_help_text           => '',
  p_mask_form           => '',
  p_display_seq_form    => 5,
  p_display_in_form     => 'Y',
  p_display_as_form     => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report  => 5,
  p_display_in_report   => 'N',
  p_display_as_report   => 'WITHOUT_MODIFICATION',
  p_mask_report         => '',
  p_aggregate_by        => 'N',
  p_lov_query           => '',
  p_default_value       => '',
  p_required            => 'N',
  p_alignment           => 'R',
  p_display_width       => 30,
  p_max_width           => 30,
  p_height              => 1,
  p_group_by            => 'N',
  p_order_by_seq        => null,
  p_order_by_asc_desc   => '',
  p_searchable          => 'N');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_column_id           => 1124529461073110 + wwv_flow_api.g_id_offset,
  p_table_id            => 1123901882073080 + wwv_flow_api.g_id_offset,
  p_column_name         => 'YLOAD',
  p_label               => 'Yload',
  p_help_text           => '',
  p_mask_form           => '',
  p_display_seq_form    => 6,
  p_display_in_form     => 'Y',
  p_display_as_form     => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report  => 6,
  p_display_in_report   => 'N',
  p_display_as_report   => 'WITHOUT_MODIFICATION',
  p_mask_report         => '',
  p_aggregate_by        => 'N',
  p_lov_query           => '',
  p_default_value       => '',
  p_required            => 'N',
  p_alignment           => 'R',
  p_display_width       => 30,
  p_max_width           => 30,
  p_height              => 1,
  p_group_by            => 'N',
  p_order_by_seq        => null,
  p_order_by_asc_desc   => '',
  p_searchable          => 'N');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_column_id           => 1124607808073110 + wwv_flow_api.g_id_offset,
  p_table_id            => 1123901882073080 + wwv_flow_api.g_id_offset,
  p_column_name         => 'SHOVID',
  p_label               => 'Shovid',
  p_help_text           => '',
  p_mask_form           => '',
  p_display_seq_form    => 7,
  p_display_in_form     => 'Y',
  p_display_as_form     => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report  => 7,
  p_display_in_report   => 'Y',
  p_display_as_report   => 'WITHOUT_MODIFICATION',
  p_mask_report         => '',
  p_aggregate_by        => 'N',
  p_lov_query           => '',
  p_default_value       => '',
  p_required            => 'N',
  p_alignment           => 'L',
  p_display_width       => 30,
  p_max_width           => 30,
  p_height              => 1,
  p_group_by            => 'N',
  p_order_by_seq        => null,
  p_order_by_asc_desc   => '',
  p_searchable          => 'Y');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_column_id           => 1124700698073110 + wwv_flow_api.g_id_offset,
  p_table_id            => 1123901882073080 + wwv_flow_api.g_id_offset,
  p_column_name         => 'VTWEIGHT',
  p_label               => 'Vtweight',
  p_help_text           => '',
  p_mask_form           => '',
  p_display_seq_form    => 8,
  p_display_in_form     => 'Y',
  p_display_as_form     => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report  => 8,
  p_display_in_report   => 'Y',
  p_display_as_report   => 'WITHOUT_MODIFICATION',
  p_mask_report         => '',
  p_aggregate_by        => 'N',
  p_lov_query           => '',
  p_default_value       => '',
  p_required            => 'N',
  p_alignment           => 'R',
  p_display_width       => 30,
  p_max_width           => 30,
  p_height              => 1,
  p_group_by            => 'N',
  p_order_by_seq        => null,
  p_order_by_asc_desc   => '',
  p_searchable          => 'N');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_column_id           => 1124803447073110 + wwv_flow_api.g_id_offset,
  p_table_id            => 1123901882073080 + wwv_flow_api.g_id_offset,
  p_column_name         => 'STANDARDWEIGHT',
  p_label               => 'Standardweight',
  p_help_text           => '',
  p_mask_form           => '',
  p_display_seq_form    => 9,
  p_display_in_form     => 'Y',
  p_display_as_form     => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report  => 9,
  p_display_in_report   => 'Y',
  p_display_as_report   => 'WITHOUT_MODIFICATION',
  p_mask_report         => '',
  p_aggregate_by        => 'N',
  p_lov_query           => '',
  p_default_value       => '',
  p_required            => 'N',
  p_alignment           => 'R',
  p_display_width       => 30,
  p_max_width           => 30,
  p_height              => 1,
  p_group_by            => 'N',
  p_order_by_seq        => null,
  p_order_by_asc_desc   => '',
  p_searchable          => 'N');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_column_id           => 1124907110073110 + wwv_flow_api.g_id_offset,
  p_table_id            => 1123901882073080 + wwv_flow_api.g_id_offset,
  p_column_name         => 'COLOR',
  p_label               => 'Color',
  p_help_text           => '',
  p_mask_form           => '',
  p_display_seq_form    => 10,
  p_display_in_form     => 'Y',
  p_display_as_form     => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report  => 10,
  p_display_in_report   => 'Y',
  p_display_as_report   => 'WITHOUT_MODIFICATION',
  p_mask_report         => '',
  p_aggregate_by        => 'N',
  p_lov_query           => '',
  p_default_value       => '',
  p_required            => 'N',
  p_alignment           => 'L',
  p_display_width       => 30,
  p_max_width           => 30,
  p_height              => 1,
  p_group_by            => 'N',
  p_order_by_seq        => null,
  p_order_by_asc_desc   => '',
  p_searchable          => 'Y');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_column_id           => 1125017804073110 + wwv_flow_api.g_id_offset,
  p_table_id            => 1123901882073080 + wwv_flow_api.g_id_offset,
  p_column_name         => 'PEREGRUZ_PERCENT',
  p_label               => 'Peregruz Percent',
  p_help_text           => '',
  p_mask_form           => '',
  p_display_seq_form    => 11,
  p_display_in_form     => 'Y',
  p_display_as_form     => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report  => 11,
  p_display_in_report   => 'Y',
  p_display_as_report   => 'WITHOUT_MODIFICATION',
  p_mask_report         => '',
  p_aggregate_by        => 'N',
  p_lov_query           => '',
  p_default_value       => '',
  p_required            => 'N',
  p_alignment           => 'R',
  p_display_width       => 30,
  p_max_width           => 30,
  p_height              => 1,
  p_group_by            => 'N',
  p_order_by_seq        => null,
  p_order_by_asc_desc   => '',
  p_searchable          => 'N');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_column_id           => 1321827677848682 + wwv_flow_api.g_id_offset,
  p_table_id            => 1321716565848641 + wwv_flow_api.g_id_offset,
  p_column_name         => 'ID_MODEL',
  p_label               => 'Id Model',
  p_help_text           => '',
  p_mask_form           => '',
  p_display_seq_form    => 1,
  p_display_in_form     => 'Y',
  p_display_as_form     => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report  => 1,
  p_display_in_report   => 'Y',
  p_display_as_report   => 'WITHOUT_MODIFICATION',
  p_mask_report         => '',
  p_aggregate_by        => 'N',
  p_lov_query           => '',
  p_default_value       => '',
  p_required            => 'N',
  p_alignment           => 'R',
  p_display_width       => 30,
  p_max_width           => 30,
  p_height              => 1,
  p_group_by            => 'N',
  p_order_by_seq        => null,
  p_order_by_asc_desc   => '',
  p_searchable          => 'N');
 
end;
/

 
begin
 
wwv_flow_hint.create_column_hint_priv(
  p_column_id           => 1321930009848682 + wwv_flow_api.g_id_offset,
  p_table_id            => 1321716565848641 + wwv_flow_api.g_id_offset,
  p_column_name         => 'MODEL_NAME',
  p_label               => 'Model Name',
  p_help_text           => '',
  p_mask_form           => '',
  p_display_seq_form    => 2,
  p_display_in_form     => 'Y',
  p_display_as_form     => 'TEXT',
  p_display_as_tab_form => 'TEXT',
  p_display_seq_report  => 2,
  p_display_in_report   => 'Y',
  p_display_as_report   => 'WITHOUT_MODIFICATION',
  p_mask_report         => '',
  p_aggregate_by        => 'N',
  p_lov_query           => '',
  p_default_value       => '',
  p_required            => 'N',
  p_alignment           => 'L',
  p_display_width       => 60,
  p_max_width           => 255,
  p_height              => 1,
  p_group_by            => 'N',
  p_order_by_seq        => null,
  p_order_by_asc_desc   => '',
  p_searchable          => 'Y');
 
end;
/

commit;
begin 
execute immediate 'alter session set nls_numeric_characters='''||wwv_flow_api.g_nls_numeric_chars||'''';
end;
/
set verify on
set feedback on
prompt  ...done
