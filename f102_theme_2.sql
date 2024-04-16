set define off
set verify off
set serveroutput on size 1000000
set feedback off
WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
begin wwv_flow.g_import_in_progress := true; end; 
/
 
--       AAAA       PPPPP   EEEEEE  XX      XX
--      AA  AA      PP  PP  EE       XX    XX
--     AA    AA     PP  PP  EE        XX  XX
--    AAAAAAAAAA    PPPPP   EEEE       XXXX
--   AA        AA   PP      EE        XX  XX
--  AA          AA  PP      EE       XX    XX
--  AA          AA  PP      EEEEEE  XX      XX
prompt  Set Credentials...
 
begin
 
  -- Assumes you are running the script connected to SQL*Plus as the Oracle user APEX_030200 or as the owner (parsing schema) of the application.
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
 
-- This date identifies the minimum version required to import this file.
wwv_flow_api.set_version(p_version_yyyy_mm_dd=>'2009.01.12');
 
end;
/

prompt  Set Application ID...
 
begin
 
   -- SET APPLICATION ID
   wwv_flow.g_flow_id := 102;
   wwv_flow_api.g_id_offset := 0;
null;
 
end;
/

--application/themes/2
 
begin
 
    wwv_flow.g_flow_theme_id := 2;
null;
 
end;
/

 
--
prompt  ...theme : 2
--
prompt  ...remove existing theme ...
 
begin
 
 wwv_flow_api.delete_theme(p_flow_id=> wwv_flow.g_flow_id , p_theme_id=>wwv_flow.g_flow_theme_id ,p_import=>'Y');
null;
 
end;
/

prompt  ...page templates for application: 102
--
--application/shared_components/user_interface/templates/page/login
prompt  ......Page template 1060209561411590
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'  </body>'||chr(10)||
'</html>'||chr(10)||
'';

c3:=c3||'<div class="t2messages">#NOTIFICATION_MESSAGE#</div>'||chr(10)||
'<table cellpadding="0" border="0" cellspacing="0" summary="" style="margin-top:100px;" align="center">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_';

c3:=c3||'PREFIX#themes/theme_2/left_nav-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ReportsRegion">'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BOX_BODY##REGION_POSITION_01##REGION_POSITI';

c3:=c3||'ON_02##REGION_POSITION_03##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><i';

c3:=c3||'mg alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'#FORM_CLOSE#'||chr(10)||
''||chr(10)||
'';

wwv_flow_api.create_template(
  p_id=> 1060209561411590 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Login',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>'||chr(10)||
''||chr(10)||
'',
  p_navigation_bar=> '',
  p_navbar_entry=> '',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_template_comment => '18');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs
prompt  ......Page template 1060300688411602
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'<td valign="top" width="100%">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar';

c3:=c3||'01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height="35" /><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td class="t2topbar05"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%"><br /></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topba';

c3:=c3||'r-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" valign="top"><br/></td>'||chr(10)||
'<td colspan="3" class="t2breadcrumbholder">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2body" valign="top" width="100%" colspan="3" valign="top" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NO';

c3:=c3||'TIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 1060300688411602 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>'||chr(10)||
'',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/no_tabs_with_side_bar
prompt  ......Page template 1060415644411602
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'<td valign="top" width="100%">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar';

c3:=c3||'01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height="35" /><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td class="t2topbar05"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%"><br /></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topba';

c3:=c3||'r-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" class="t2sidebar" valign="top">#REGION_POSITION_02#</td>'||chr(10)||
'<td colspan="3" class="t2breadcrumbholder" height="20">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2body" valign="top" width="100%" colspan="3" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><d';

c3:=c3||'iv class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 1060415644411602 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'No Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 17,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs
prompt  ......Page template 1060523041411602
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'<td valign="top" width="100%">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%"><br /></td>'||chr(10)||
'<td';

c3:=c3||' class="t2tabholder" valign="bottom"><table width="100%" cellpadding="0" cellspacing="0" border="0" summary=""><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" height="70%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height="35" /><img alt="" src="#IMAGE';

c3:=c3||'_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td class="t2topbar05"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%"><br /></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" valign="top"><br/></td>'||chr(10)||
'<td colspan="3" class';

c3:=c3||'="t2breadcrumbholder" height="20">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2body" valign="top" width="100%" colspan="3" height="100%"><table summary="" cellpadding="0" width="100%" height="70%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITIO';

c3:=c3||'N_04#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 1060523041411602 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_right.png" border="0" alt="" /></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_right.png" border="0" alt="" /></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>'||chr(10)||
'',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comment => '19');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/one_level_tabs_with_side_bar
prompt  ......Page template 1060609412411603
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'<td valign="top" width="100%">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%"><br /></td>'||chr(10)||
'<td';

c3:=c3||' class="t2tabholder" valign="bottom"><table width="100%" cellpadding="0" cellspacing="0" border="0" summary=""><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height="35" /><img alt="" src="#IMAGE';

c3:=c3||'_PREFIX#themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td class="t2topbar05"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%"><br /></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" class="t2sidebar" valign="top">#REGION_POSITI';

c3:=c3||'ON_02#</td>'||chr(10)||
'<td colspan="3" class="t2breadcrumbholder" height="20">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2body" valign="top" width="100%" colspan="3" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITIO';

c3:=c3||'N_04#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 1060609412411603 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'One Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_right.png" border="0" alt="" /></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_left.png" border="0" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_right.png" border="0" alt="" /></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>'||chr(10)||
'',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 16,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/popup
prompt  ......Page template 1060701571411603
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#</body>'||chr(10)||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_01##REGION_POSITION_02##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 1060701571411603 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Popup',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 4,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/printer_friendly
prompt  ......Page template 1060807996411603
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'#FORM_CLOSE#'||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'<td width="100%" valign="top">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_08#</td>'||chr(10)||
'</table>'||chr(10)||
'<table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top">'||chr(10)||
'<div style="border:1px solid black;">#SUCCESS_MESSAG';

c3:=c3||'E##NOTIFICATION_MESSAGE#</div>'||chr(10)||
'#BOX_BODY##REGION_POSITION_04#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'#REGION_POSITION_05#';

wwv_flow_api.create_template(
  p_id=> 1060807996411603 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Printer Friendly',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 5,
  p_translate_this_template => 'N',
  p_template_comment => '3');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs
prompt  ......Page template 1060912740411603
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<img src="#WORKSPACE_IMAGES#GVGold-Угахан.png">'||chr(10)||
'<img src="#WORKSPACE_IMAGES#cat-777g.png" width="100" height="70">'||chr(10)||
'<img src="#WORKSPACE_IMAGES#title_ASUD.PNG" width="600" height="70">'||chr(10)||
'<p id="date"></p>'||chr(10)||
'<script>'||chr(10)||
'n =  new Date();'||chr(10)||
'y = n.getFullYear();'||chr(10)||
'm = n.getMonth() + 1;'||chr(10)||
'd = n.getDate();'||chr(10)||
'hh = n.getHours();'||chr(10)||
'mi = n.getMinutes();'||chr(10)||
'ss = n.ge';

c1:=c1||'tSeconds();'||chr(10)||
'document.getElementById("date").innerHTML = d + "." + m + "." + y + "г. "+hh+ ":"+mi+ ":"+ss;'||chr(10)||
'</script>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#REGION_POSITION_05#'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'<td valign="top" width="100%">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%"><br /></td>'||chr(10)||
'#PA';

c3:=c3||'RENT_TAB_CELLS#'||chr(10)||
'<td width="6"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="6" height="1" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height="35" /><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" wi';

c3:=c3||'dth="25" height="1" /></td>'||chr(10)||
'<td class="t2topbar05"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%" valign="bottom"><table cellpadding="0" border="0" cellspacing="0" summary=""><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.png" width="8" height="35" /></td';

c3:=c3||'>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" class="t2sidebar" valign="top"><br /></td>'||chr(10)||
'<td colspan="3" class="t2breadcrumbholder">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2body" valign="top" width="100%" colspan="3" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div class="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTI';

c3:=c3||'FICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_02##REGION_POSITION_04#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 1060912740411603 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>',
  p_current_tab=> '<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_on_left.png" alt="" /></td>'||chr(10)||
'<td class="t2subtabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_on_right.png" alt="" /></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_off_left.png" alt="" /></td>'||chr(10)||
'<td class="t2subtabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_off_right.png" alt="" /></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_left.png" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_right.png" alt="" /></td>'||chr(10)||
'',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_left.png" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_right.png" alt="" /></td>',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_03',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 2,
  p_template_comment => '');
end;
 
null;
 
end;
/

--application/shared_components/user_interface/templates/page/two_level_tabs_with_side_bar
prompt  ......Page template 1061020922411604
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
c1:=c1||'<html lang="&BROWSER_LANGUAGE.">'||chr(10)||
'<head>'||chr(10)||
'<title>#TITLE#</title>'||chr(10)||
'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_3_1.css" type="text/css" />'||chr(10)||
'#HEAD#'||chr(10)||
'</head>'||chr(10)||
'<body #ONLOAD#>#FORM_OPEN#';

c2:=c2||'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-0.png"/></td>'||chr(10)||
'<td width="100%" class="t2BottomBarCenter"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-1.png"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/bottom_bar-0-3.png" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<div class="t2footer"><table width';

c2:=c2||'="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="bottom" class="t2user">&APP_USER.</td>'||chr(10)||
'<td valign="bottom" class="t2copy"><!-- Copyright --><span class="t2Customize">#CUSTOMIZE#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></div>'||chr(10)||
'<br />'||chr(10)||
'#FORM_CLOSE# '||chr(10)||
'</body>'||chr(10)||
'</html>';

c3:=c3||'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top" class="t2Logo">#LOGO##REGION_POSITION_06#</td>'||chr(10)||
'<td valign="top" width="100%">#REGION_POSITION_07#</td>'||chr(10)||
'<td valign="top" align="right">#NAVIGATION_BAR##REGION_POSITION_08#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%"><br /></td>'||chr(10)||
'<td';

c3:=c3||' class="t2tabholder" valign="bottom"><table width="100%" cellpadding="0" cellspacing="0" border="0" summary=""><tr>#PARENT_TAB_CELLS#</tr></table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'<table width="100%" cellpadding="0" border="0" cellspacing="0" summary="" height="70%">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2topbar01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-0.png" width="7" height="35" /><img alt="" src="#IMAGE_PREFIX#';

c3:=c3||'themes/theme_2/1px_trans.gif" width="25" height="1" /></td>'||chr(10)||
'<td  class="t2topbar05"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-3.png" width="21" height="35" /></td>'||chr(10)||
'<td class="t2topbar05" width="100%" valign="bottom"><table cellpadding="0" border="0" cellspacing="0" summary=""><tr><td><br /></td>#TAB_CELLS#</tr></table></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/topbar-0-6.';

c3:=c3||'png" width="8" height="35" /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td rowspan="2" class="t2sidebar" valign="top">#REGION_POSITION_02#</td>'||chr(10)||
'<td colspan="3" class="t2breadcrumbholder">#REGION_POSITION_01#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td align="left" class="t2body" valign="top" width="100%" colspan="3" height="100%"><table summary="" cellpadding="0" width="100%" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td width="100%" valign="top"><div cl';

c3:=c3||'ass="t2messages">#GLOBAL_NOTIFICATION##SUCCESS_MESSAGE##NOTIFICATION_MESSAGE#</div>#BOX_BODY##REGION_POSITION_04##REGION_POSITION_05##REGION_POSITION_06##REGION_POSITION_07##REGION_POSITION_08#</td>'||chr(10)||
'<td valign="top">#REGION_POSITION_03#<br /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_template(
  p_id=> 1061020922411604 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=> 'Two Level Tabs with Side Bar',
  p_body_title=> '',
  p_header_template=> c1,
  p_box=> c3,
  p_footer_template=> c2,
  p_success_message=> '<div class="t2success" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#SUCCESS_MESSAGE#</div>'||chr(10)||
'',
  p_current_tab=> '<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_on_left.png" alt="" /></td>'||chr(10)||
'<td class="t2subtabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_on_right.png" alt="" /></td>',
  p_current_tab_font_attr=> '',
  p_non_current_tab=> '<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_off_left.png" alt="" /></td>'||chr(10)||
'<td class="t2subtabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td valign="bottom"><img src="#IMAGE_PREFIX#themes/theme_2/subtab_off_right.png" alt="" /></td>',
  p_non_current_tab_font_attr => '',
  p_top_current_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_left.png" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOn">#TAB_LABEL##TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_on_right.png" alt="" /></td>'||chr(10)||
'',
  p_top_current_tab_font_attr => '',
  p_top_non_curr_tab=> '<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_left.png" alt="" /></td>'||chr(10)||
'<td class="t2tabcenterOff"><a href="#TAB_LINK#">#TAB_LABEL#</a>#TAB_INLINE_EDIT#</td>'||chr(10)||
'<td><img src="#IMAGE_PREFIX#themes/theme_2/tab_off_right.png" alt="" /></td>',
  p_top_non_curr_tab_font_attr=> '',
  p_current_image_tab=> '',
  p_non_current_image_tab=> '',
  p_notification_message=> '<div class="t2notification" id="MESSAGE"><img src="#IMAGE_PREFIX#delete.gif" onclick="$x_Remove(''MESSAGE'')"  style="float:right;" class="pb" alt="" />#MESSAGE#</div>'||chr(10)||
'',
  p_navigation_bar=> '<div class="t2NavigationBar">#BAR_BODY#</div>',
  p_navbar_entry=> '<a href="#LINK#" class="t2navbar">#TEXT#</a>',
  p_app_tab_before_tabs=>'',
  p_app_tab_current_tab=>'',
  p_app_tab_non_current_tab=>'',
  p_app_tab_after_tabs=>'',
  p_region_table_cattributes=> ' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"',
  p_sidebar_def_reg_pos => 'REGION_POSITION_02',
  p_breadcrumb_def_reg_pos => 'REGION_POSITION_01',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 18,
  p_translate_this_template => 'N',
  p_template_comment => '');
end;
 
null;
 
end;
/

prompt  ...button templates
--
--application/shared_components/user_interface/templates/button/button
prompt  ......Button Template 1061110998411604
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t2Button" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_left.gif" alt="" /></a></td>'||chr(10)||
'<td class="t2C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t2R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_right.gif" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>1061110998411604 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button',
  p_translate_this_template => 'N',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 1,
  p_template_comment       => '');
end;
/
--application/shared_components/user_interface/templates/button/button_alternative_1
prompt  ......Button Template 1061216876411634
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t2ButtonAlternative1" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt1_left.gif" alt="" /></a></td>'||chr(10)||
'<td class="t2C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t2R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt1_right.gif" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>1061216876411634 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 1',
  p_translate_this_template => 'N',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 4,
  p_template_comment       => '');
end;
/
--application/shared_components/user_interface/templates/button/button_alternative_2
prompt  ......Button Template 1061323811411634
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t2ButtonAlternative2" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt2_left.gif" alt="" /></a></td>'||chr(10)||
'<td class="t2C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t2R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt2_right.gif" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>1061323811411634 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 2',
  p_translate_this_template => 'N',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 5,
  p_template_comment       => '');
end;
/
--application/shared_components/user_interface/templates/button/button_alternative_3
prompt  ......Button Template 1061429296411634
declare
  t varchar2(32767) := null;
  l_clob clob;
  l_length number := 1;
begin
t:=t||'<table class="t2ButtonAlternative3" cellspacing="0" cellpadding="0" border="0"  summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt3_left.gif" alt="" /></a></td>'||chr(10)||
'<td class="t2C"><a href="#LINK#">#LABEL#</a></td>'||chr(10)||
'<td class="t2R"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/theme_2/button_alt3_right.gif" alt="" /></a></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

wwv_flow_api.create_button_templates (
  p_id=>1061429296411634 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_template=>t,
  p_template_name=> 'Button, Alternative 3',
  p_translate_this_template => 'N',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 2,
  p_template_comment       => '');
end;
/
---------------------------------------
prompt  ...region templates
--
--application/shared_components/user_interface/templates/region/borderless_region
prompt  ......region template 1061530675411634
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_na';

t:=t||'v-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2BorderlessRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nb';

t:=t||'sp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></';

t:=t||'td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1061530675411634 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Borderless Region',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 7,
  p_plug_heading_bgcolor => '#FFFFFF',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1061530675411634 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/bracketed_region
prompt  ......region template 1061603591411635
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_na';

t:=t||'v-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2BracketedRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbs';

t:=t||'p;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></t';

t:=t||'d>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1061603591411635 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Bracketed Region',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 18,
  p_plug_heading_bgcolor => '#FFFFFF',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1061603591411635 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/breadcrumb_region
prompt  ......region template 1061722315411635
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div class="t2BreadcrumbRegion"  id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1061722315411635 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Breadcrumb Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 6,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1061722315411635 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_with_title
prompt  ......region template 1061830464411635
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_na';

t:=t||'v-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ButtonRegionwithTitle">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2ButtonHolder" valign="top">#CL';

t:=t||'OSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#<img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" style="display:block;" width="582" height="1" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/t';

t:=t||'heme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#BODY#';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1061830464411635 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region with Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 4,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1061830464411635 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/button_region_without_title
prompt  ......region template 1061912847411635
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="600" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_';

t:=t||'nav-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ButtonRegionwithoutTitle">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2ButtonHolder" valign="top">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##C';

t:=t||'REATE##CREATE2##EXPAND##COPY##HELP#<img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" style="display:block;" width="582" height="1" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class';

t:=t||'="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>#BODY#';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1061912847411635 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Button Region without Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 17,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1061912847411635 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_list
prompt  ......region template 1062003017411635
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_na';

t:=t||'v-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2GCCHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2GCCHeader" align="right" valign="bottom"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t';

t:=t||'2GCCBody" colspan="2" valign="top"><table cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_2/chart.gif" alt="" /></td>'||chr(10)||
'<td valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#';

t:=t||'IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1062003017411635 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart List',
  p_plug_table_bgcolor     => '',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1062003017411635 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/chart_region
prompt  ......region template 1062108164411635
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_na';

t:=t||'v-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ChartRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&n';

t:=t||'bsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2Body" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td cla';

t:=t||'ss="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1062108164411635 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Chart Region',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 30,
  p_plug_heading_bgcolor => '#FFFFFF',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1062108164411635 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/form_region
prompt  ......region template 1062221166411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_na';

t:=t||'v-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2FormRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nb';

t:=t||'sp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#<img src="#IMAGE_PREFIX#/themes/theme_2/1px_trans.gif" height="1" width="582" style="display:block;" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>';

t:=t||''||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1062221166411636 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Form Region',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 8,
  p_plug_heading_bgcolor => '#FFFFFF',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1062221166411636 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/hide_and_show_region
prompt  ......region template 1062308116411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_na';

t:=t||'v-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2HideandShowRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#<a style="margin-left:5px;" href="javascript:hideShow(''region#RE';

t:=t||'GION_SEQUENCE_ID#'',''shIMG#REGION_SEQUENCE_ID#'',''#IMAGE_PREFIX#themes/theme_2/showhide_hidden.gif'',''#IMAGE_PREFIX#themes/theme_2/showhide_show.gif'');" class="t2HideandShowRegionLink"><img src="#IMAGE_PREFIX#themes/theme_2/showhide_hidden.gif" '||chr(10)||
'  id="shIMG#REGION_SEQUENCE_ID#" alt="" /></a></td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE';

t:=t||'##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2"><div class="t2Hide" id="region#REGION_SEQUENCE_ID#">#BODY#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" he';

t:=t||'ight="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1062308116411636 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Hide and Show Region',
  p_plug_table_bgcolor     => '',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 1,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1062308116411636 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region
prompt  ......region template 1062422058411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<div class="t2NavigationRegion" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#BODY#</div>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1062422058411636 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region',
  p_plug_table_bgcolor     => '#F7F7E7',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 5,
  p_plug_heading_bgcolor => '#F7F7E7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1062422058411636 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/navigation_region_alternative_1
prompt  ......region template 1062509495411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table border="0" cellspacing="0" cellpadding="0" summary="" class="t2NavigationRegionAlternative1" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1062509495411636 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Navigation Region, Alternative 1',
  p_plug_table_bgcolor     => '#F7F7E7',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 16,
  p_plug_heading_bgcolor => '#F7F7E7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1062509495411636 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_buttons_and_titles
prompt  ......region template 1062606236411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_na';

t:=t||'v-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2RegionwithoutButtonsandTitles">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img al';

t:=t||'t="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'<';

t:=t||'/tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1062606236411636 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Buttons and Titles',
  p_plug_table_bgcolor     => '',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 19,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1062606236411636 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/region_without_title
prompt  ......region template 1062713294411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_na';

t:=t||'v-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2RegionwithoutTitle">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE';

t:=t||'##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes';

t:=t||'/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1062713294411636 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Region without Title',
  p_plug_table_bgcolor     => '',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 11,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1062713294411636 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_filter_single_row
prompt  ......region template 1062830583411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table class="apex_finderbar" cellpadding="0" cellspacing="0" border="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>'||chr(10)||
'<tbody>'||chr(10)||
'<tr>'||chr(10)||
'<td class="apex_finderbar_left_top" valign="top"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8" alt=""  class="spacer" alt="" /></td>'||chr(10)||
'<td class="apex_finderbar_middle" rowspan="3" valign="middle"><img src="#IMAGE_PREFIX#htmldb/builder/builder_f';

t:=t||'ind.png" /></td>'||chr(10)||
'<td class="apex_finderbar_middle" rowspan="3" valign="middle" style="">#BODY#</td>'||chr(10)||
'<td class="apex_finderbar_left" rowspan="3" width="10"><br /></td>'||chr(10)||
'<td class="apex_finderbar_buttons" rowspan="3" valign="middle" nowrap="nowrap"><span class="apex_close">#CLOSE#</span><span>#EDIT##CHANGE##DELETE##CREATE##CREATE2##COPY##PREVIOUS##NEXT##EXPAND##HELP#</span></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr><td class="';

t:=t||'apex_finderbar_left_middle"><br /></td></tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="apex_finderbar_left_bottom" valign="bottom"><img src="#IMAGE_PREFIX#1px_trans.gif" width="10" height="8"  class="spacer" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</tbody>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1062830583411636 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Report Filter - Single Row',
  p_plug_table_bgcolor     => '',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 31,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1062830583411636 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/report_list
prompt  ......region template 1062930526411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_na';

t:=t||'v-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody">'||chr(10)||
''||chr(10)||
'<table border="0" cellspacing="0" cellpadding="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2GCCHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2GCCHeader" align="right" valign="bottom"><br /></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class=';

t:=t||'"t2GCCBody" colspan="2" valign="top"><table cellpadding="0" border="0" cellspacing="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_2/report.gif" /></td>'||chr(10)||
'<td valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
''||chr(10)||
'</td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IM';

t:=t||'AGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1062930526411636 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Report List',
  p_plug_table_bgcolor     => '',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 29,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1062930526411636 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region
prompt  ......region template 1063030283411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_na';

t:=t||'v-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ReportsRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;';

t:=t||'&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>';

t:=t||''||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1063030283411636 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 9,
  p_plug_heading_bgcolor => '#FFFFFF',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1063030283411636 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_100_width
prompt  ......region template 1063130266411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" width="100%" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/th';

t:=t||'eme_2/left_nav-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody" width="100%"><table border="0" cellspacing="0" cellpadding="0" summary="" width="100%" class="t2ReportsRegion100Width">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2Bu';

t:=t||'ttonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_';

t:=t||'2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1063130266411636 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region 100% Width',
  p_plug_table_bgcolor     => '',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 13,
  p_plug_heading_bgcolor => '',
  p_plug_font_size => '',
  p_translate_this_template => 'N',
  p_template_comment       => 'Outline, tab-title, 100%');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1063130266411636 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/reports_region_alternative_1
prompt  ......region template 1063227443411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2greyround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/gre';

t:=t||'y-region-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2greyround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2greyroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2ReportsRegionAlternative1">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="botto';

t:=t||'m">#CLOSE#&nbsp;&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2greyround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-2-0.png" w';

t:=t||'idth="9" height="9"/></td>'||chr(10)||
'<td class="t2greyround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1063227443411636 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Reports Region, Alternative 1',
  p_plug_table_bgcolor     => '#FFFFFF',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 10,
  p_plug_heading_bgcolor => '#FFFFFF',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1063227443411636 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region
prompt  ......region template 1063313296411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_na';

t:=t||'v-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2SidebarRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top">#BODY#</td>'||chr(10)||
'<';

t:=t||'/tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/them';

t:=t||'e_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1063313296411636 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region',
  p_plug_table_bgcolor     => '#F7F7E7',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 2,
  p_plug_heading_bgcolor => '#F7F7E7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1063313296411636 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/sidebar_region_alternative_1
prompt  ......region template 1063427924411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2greyround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/gre';

t:=t||'y-region-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2greyround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2greyroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2SidebarRegionAlternative1">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" vali';

t:=t||'gn="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2greyround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/grey-region-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2greyround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src';

t:=t||'="#IMAGE_PREFIX#themes/theme_2/grey-region-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1063427924411636 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Sidebar Region, Alternative 1',
  p_plug_table_bgcolor     => '#F7F7E7',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 3,
  p_plug_heading_bgcolor => '#F7F7E7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1063427924411636 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region
prompt  ......region template 1063511244411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_na';

t:=t||'v-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2WizardRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp;&nbsp;&';

t:=t||'nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'';

t:=t||'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width="9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1063511244411636 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 12,
  p_plug_heading_bgcolor => '#f7f7e7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1063511244411636 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/region/wizard_region_with_icon
prompt  ......region template 1063616685411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_length number := 1;
begin
t:=t||'<table cellpadding="0" border="0" cellspacing="0" summary="" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="htmldbRegion">'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-0-0.png" width="9" height="11"/></td>'||chr(10)||
'<td class="t2stdround01"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_na';

t:=t||'v-0-3.png" width="9" height="11"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2stdround10"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td class="t2stroundbody"><table border="0" cellspacing="0" cellpadding="0" summary="" class="t2WizardRegionwithIcon">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionHeader" valign="bottom">#TITLE#</td>'||chr(10)||
'<td class="t2ButtonHolder" valign="bottom">#CLOSE#&nbsp';

t:=t||';&nbsp;&nbsp;#PREVIOUS##NEXT##DELETE##EDIT##CHANGE##CREATE##CREATE2##EXPAND##COPY##HELP#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2RegionBody" valign="top" colspan="2"><table summary="" cellpadding="0" cellspacing="0" border="0">'||chr(10)||
'<tr>'||chr(10)||
'<td valign="top"><img src="#IMAGE_PREFIX#themes/theme_2/wizard_icon.gif" alt=""/></td>'||chr(10)||
'<td width="100%" valign="top">#BODY#</td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table></td>'||chr(10)||
'<td class';

t:=t||'="t2stdround13"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-0.png" width="9" height="9"/></td>'||chr(10)||
'<td class="t2stdround21"><img alt="" src="#IMAGE_PREFIX#themes/theme_2/1px_trans.gif" width="1" height="1"/></td>'||chr(10)||
'<td><img alt="" src="#IMAGE_PREFIX#themes/theme_2/left_nav-2-3.png" width=';

t:=t||'"9" height="9"/></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2 := null;
wwv_flow_api.create_plug_template (
  p_id       => 1063616685411636 + wwv_flow_api.g_id_offset,
  p_flow_id  => wwv_flow.g_flow_id,
  p_template => t,
  p_page_plug_template_name=> 'Wizard Region with Icon',
  p_plug_table_bgcolor     => '#f7f7e7',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 20,
  p_plug_heading_bgcolor => '#f7f7e7',
  p_plug_font_size => '-1',
  p_translate_this_template => 'N',
  p_template_comment       => '');
end;
null;
 
end;
/

 
begin
 
declare
    t2 varchar2(32767) := null;
begin
t2 := null;
wwv_flow_api.set_plug_template_tab_attr (
  p_id=> 1063616685411636 + wwv_flow_api.g_id_offset,
  p_form_table_attr=> t2 );
exception when others then null;
end;
null;
 
end;
/

prompt  ...List Templates
--
--application/shared_components/user_interface/templates/list/vertical_images_list_custom_2_1
prompt  ......list template 1063721164411636
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td align="left"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></td><td align="left"><a href="#LINK#">#TEXT#</a></td></tr>'||chr(10)||
'';

t2:=t2||'<tr><td align="left"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></td><td align="left"><a href="#LINK#">#TEXT#</a></td></tr>'||chr(10)||
'';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1063721164411636 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>' Vertical Images List (Custom 2) 1',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 10,
  p_list_template_before_rows=>'<table border="0" cellpadding="0" cellspacing="5" summary="" >',
  p_list_template_after_rows=>'</table>'||chr(10)||
'',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/button_list
prompt  ......list template 1063824038411643
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<table class="t2ButtonList" cellspacing="0" cellpadding="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><img src="#IMAGE_PREFIX#/themes/theme_2/button_list_left.png" alt="" /></td>'||chr(10)||
'<td class="t2C"><a href="#LINK#">#TEXT#</a></td>'||chr(10)||
'<td class="t2R"><img src="#IMAGE_PREFIX#/themes/theme_2/button_list_right.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t2:=t2||'<table class="t2ButtonList" cellspacing="0" cellpadding="0" border="0" summary="">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2L"><img src="#IMAGE_PREFIX#/themes/theme_2/button_list_left.png" alt="" /></td>'||chr(10)||
'<td class="t2NC"><a href="#LINK#">#TEXT#</a></td>'||chr(10)||
'<td class="t2R"><img src="#IMAGE_PREFIX#/themes/theme_2/button_list_right.png" alt="" /></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1063824038411643 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Button List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 6,
  p_list_template_before_rows=>'<div class="t2ButtonList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/dhtml_menu_with_sublist
prompt  ......list template 1063904800411643
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li class="dhtmlMenuItem"><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li class="dhtmlMenuSep2"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt="" class="dhtmlMenuSep2" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_13/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t6:=t6||'<li class="dhtmlMenuItem1"><a href="#LINK#">#TEXT#</a><img src="#IMAGE_PREFIX#themes/theme_13/menu_small.gif" alt="Expand" onclick="app_AppMenuMultiOpenBottom2(this,''#LIST_ITEM_ID#'',false)" /></li>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>1063904800411643 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Menu with Sublist',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 20,
  p_list_template_before_rows=>'<ul class="dhtmlMenuLG2">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/dhtml_tree
prompt  ......list template 1064007650411643
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif" align="middle"  alt="" /><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><img src="#IMAGE_PREFIX#themes/theme_13/node.gif"  align="middle" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" align="middle"  onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><img src="#IMAGE_PREFIX#themes/theme_13/plus.gif" onclick="htmldb_ToggleWithImage(this,''#LIST_ITEM_ID#'')" align="middle" class="pseudoButtonInactive" alt="" /><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>1064007650411643 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'DHTML Tree',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 22,
  p_list_template_before_rows=>'<ul class="dhtmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" style="display:none;" class="dhtmlTree">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_images_with_label_list
prompt  ......list template 1064116357411644
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<td class="t2current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" /><br />#TEXT#</td>';

t2:=t2||'<td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" /></a><br /><a href="#LINK#">#TEXT#</a></td>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1064116357411644 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Images with Label List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 4,
  p_list_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" class="t2HorizontalImageswithLabelList"><tr>',
  p_list_template_after_rows=>'</tr></table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/horizontal_links_list
prompt  ......list template 1064219457411644
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t2current">#TEXT#</a>';

t2:=t2||'<a href="#LINK#">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1064219457411644 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Horizontal Links List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 3,
  p_list_template_before_rows=>'<div class="t2HorizontalLinksList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu_with_image
prompt  ......list template 1064314211411644
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down_nochild.png" width="20" height="128" alt=""  /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#menu/drop_down.png" width="20" height="128" alt=""  class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>1064314211411644 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu with Image',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 21,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/pull_down_menu_with_image_custom_1
prompt  ......list template 1064405141411644
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t2:=t2||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# alt="" /></a><img src="#IMAGE_PREFIX#themes/generic_nochild.gif" width="22" height="75" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t3:=t3||'<li class="dhtmlMenuSep"><img src="#IMAGE_PREFIX#themes/theme_13/1px_trans.gif"  width="1" height="1" alt=""  class="dhtmlMenuSep" /></li>';

t4:=t4||'<li><a href="#LINK#" class="dhtmlSubMenuN" onmouseover="dhtml_CloseAllSubMenusL(this)">#TEXT#</a></li>';

t5:=t5||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# alt="" /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t6:=t6||'<div class="dhtmlMenuItem"><a href="#LINK#"><img src="#IMAGE_PREFIX#themes/generic_list.gif" #IMAGE_ATTR# alt="" /></a><img src="#IMAGE_PREFIX#themes/generic_open.gif" width="22" height="75" class="dhtmlMenu" onclick="app_AppMenuMultiOpenBottom(this,''#LIST_ITEM_ID#'',false)" alt="" /><a href="#LINK#" class="dhtmlBottom">#TEXT#</a></div>';

t7:=t7||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" /></a></li>';

t8:=t8||'<li class="dhtmlSubMenuS"><a href="#LINK#" class="dhtmlSubMenuS" onmouseover="dhtml_MenuOpen(this,''#LIST_ITEM_ID#'',true,''Left'')"><span style="float:left;">#TEXT#</span><img class="t13MIMG" src="#IMAGE_PREFIX#menu_open_right2.gif" alt="" /></a></li>';

wwv_flow_api.create_list_template (
  p_id=>1064405141411644 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Pull Down Menu with Image (Custom 1)',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 9,
  p_list_template_before_rows=>'<div class="dhtmlMenuLG">',
  p_list_template_after_rows=>'</div><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#" class="dhtmlSubMenu2" style="display:none;"><li class="dhtmlSubMenuP" onmouseover="dhtml_CloseAllSubMenusL(this)">#PARENT_TEXT#</li>',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/tabbed_navigation_list
prompt  ......list template 1064529263411644
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a class="t2current" href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>'||chr(10)||
'';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1064529263411644 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tabbed Navigation List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 7,
  p_list_template_before_rows=>'<ul class="t2TabbedNavigationList">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/tree_list
prompt  ......list template 1064628019411644
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3:=t3||'<li><a href="#LINK#">#TEXT#</a></li>';

t4:=t4||'<li><a href="#LINK#">#TEXT#</a></li>';

t5:=t5||'<li><a href="#LINK#">#TEXT#</a></li>';

t6:=t6||'<li><a href="#LINK#">#TEXT#</a></li>';

t7:=t7||'<li><a href="#LINK#">#TEXT#</a></li>';

t8:=t8||'<li><a href="#LINK#">#TEXT#</a></li>';

wwv_flow_api.create_list_template (
  p_id=>1064628019411644 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Tree List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 23,
  p_list_template_before_rows=>'<ul class="htmlTree">',
  p_list_template_after_rows=>'</ul><br style="clear:both;"/><br style="clear:both;"/>',
  p_before_sub_list=>'<ul id="#PARENT_LIST_ITEM_ID#" htmldb:listlevel="#LEVEL#">',
  p_after_sub_list=>'</ul>',
  p_sub_list_item_current=> t3,
  p_sub_list_item_noncurrent=> t4,
  p_item_templ_curr_w_child=> t5,
  p_item_templ_noncurr_w_child=> t6,
  p_sub_templ_curr_w_child=> t7,
  p_sub_templ_noncurr_w_child=> t8,
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_images_list
prompt  ......list template 1064713570411644
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t2current"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" /><br />#TEXT#</td></tr>';

t2:=t2||'<tr><td><a href="#LINK#"><img src="#IMAGE_PREFIX##IMAGE#" #IMAGE_ATTR# alt="" /><br />#TEXT#</a></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1064713570411644 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Images List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 5,
  p_list_template_before_rows=>'<table cellpadding="0" cellspacing="0" border="0" summary="0" class="t2VerticalImagesList">',
  p_list_template_after_rows=>'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_ordered_list
prompt  ......list template 1064805037411644
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t2current"><a href="#LINK#">#TEXT#</a></li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1064805037411644 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Ordered List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 2,
  p_list_template_before_rows=>'<ol class="t2VerticalOrderedList">',
  p_list_template_after_rows=>'</ol>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_sidebar_list
prompt  ......list template 1064926217411644
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<a href="#LINK#" class="t2navcurrent">#TEXT#</a>';

t2:=t2||'<a href="#LINK#" class="t2nav">#TEXT#</a>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1064926217411644 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Sidebar List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 19,
  p_list_template_before_rows=>'<div class="t2VerticalSidebarList">',
  p_list_template_after_rows=>'</div>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_with_bullet
prompt  ......list template 1065026387411644
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t2current">#TEXT#</li>'||chr(10)||
'';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>'||chr(10)||
'';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1065026387411644 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List with Bullet',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 1,
  p_list_template_before_rows=>'<ul class="t2VerticalUnorderedListwithBullet">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/vertical_unordered_list_without_bullet
prompt  ......list template 1065126419411644
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<li class="t2current">#TEXT#</li>';

t2:=t2||'<li><a href="#LINK#">#TEXT#</a></li>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1065126419411644 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Vertical Unordered List without Bullet',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 18,
  p_list_template_before_rows=>'<ul class="t2VerticalUnorderedListwithoutBullet">',
  p_list_template_after_rows=>'</ul>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/list/wizard_progress_list
prompt  ......list template 1065227087411644
 
begin
 
declare
  t varchar2(32767) := null;
  t2 varchar2(32767) := null;
  t3 varchar2(32767) := null;
  t4 varchar2(32767) := null;
  t5 varchar2(32767) := null;
  t6 varchar2(32767) := null;
  t7 varchar2(32767) := null;
  t8 varchar2(32767) := null;
  l_clob clob;
  l_clob2 clob;
  l_clob3 clob;
  l_clob4 clob;
  l_clob5 clob;
  l_clob6 clob;
  l_clob7 clob;
  l_clob8 clob;
  l_length number := 1;
begin
t:=t||'<tr><td class="t2current">#TEXT#<br /><img src="#IMAGE_PREFIX#themes/theme_2/arrow_down.gif" alt="Down" /></td></tr>';

t2:=t2||'<tr><td>#TEXT#<br /><img src="#IMAGE_PREFIX#themes/theme_2/arrow_down.gif" alt="Down" /></td></tr>';

t3 := null;
t4 := null;
t5 := null;
t6 := null;
t7 := null;
t8 := null;
wwv_flow_api.create_list_template (
  p_id=>1065227087411644 + wwv_flow_api.g_id_offset,
  p_flow_id=>wwv_flow.g_flow_id,
  p_list_template_current=>t,
  p_list_template_noncurrent=> t2,
  p_list_template_name=>'Wizard Progress List',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 17,
  p_list_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" class="t2WizardProgressList">',
  p_list_template_after_rows=>'<tr><td>&DONE.</td></tr>'||chr(10)||
'</table>',
  p_translate_this_template => 'N',
  p_list_template_comment=>'');
end;
null;
 
end;
/

prompt  ...report templates
--
--application/shared_components/user_interface/templates/report/borderless
prompt  ......report template 1065311339411644
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1065311339411644 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Borderless',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t2borderless">'||chr(10)||
''||chr(10)||
'',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t2header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>'||chr(10)||
'',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1065311339411644 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/horizontal_border
prompt  ......report template 1065420411411646
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1065420411411646 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Horizontal Border',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t2HorizontalBorder">',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th class="t2header"  id="#COLUMN_HEADER_NAME#" #ALIGNMENT#>#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1065420411411646 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/one_column_unordered_list
prompt  ......report template 1065524226411647
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<li>#COLUMN_VALUE#</li>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1065524226411647 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'One Column Unordered List',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" cellspacing="0" border="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr><td><ul class="t2OneColumnUnorderedList">',
  p_row_template_after_rows =>'</ul><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 3,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1065524226411647 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'OMIT',
  p_row_template_after_last =>'OMIT');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard
prompt  ......report template 1065603644411647
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1065603644411647 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t2standard">',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t2header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 4,
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1065603644411647 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_ppr
prompt  ......report template 1065729618411647
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2data">#COLUMN_VALUE#</td>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1065729618411647 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard (PPR)',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<div id="report#REGION_ID#"><htmldb:#REGION_ID#><table cellpadding="0" border="0" cellspacing="0" summary="">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t2standard">',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>'||chr(10)||
'#PAGINATION#'||chr(10)||
'</table><script language=JavaScript type=text/javascript>'||chr(10)||
'<!--'||chr(10)||
'init_htmlPPRReport(''#REGION_ID#'');'||chr(10)||
''||chr(10)||
'//-->'||chr(10)||
'</script>'||chr(10)||
'</htmldb:#REGION_ID#>'||chr(10)||
'</div>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t2header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="javascript:html_PPR_Report_Page(this,''#REGION_ID#'',''#LINK#'')" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 7,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1065729618411647 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/standard_alternating_row_colors
prompt  ......report template 1065822217411647
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2data">#COLUMN_VALUE#</td>';

c2:=c2||'<td#ALIGNMENT# headers="#COLUMN_HEADER_NAME#" class="t2dataalt">#COLUMN_VALUE#</td>';

c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1065822217411647 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Standard, Alternating Row Colors',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">#TOP_PAGINATION#'||chr(10)||
'<tr>'||chr(10)||
'<td><table cellpadding="0" border="0" cellspacing="0" summary="" class="t2standardalternatingrowcolors">',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td>'||chr(10)||
'</tr>#PAGINATION#'||chr(10)||
'</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'<th#ALIGNMENT# id="#COLUMN_HEADER_NAME#" class="t2header">#COLUMN_HEADER#</th>',
  p_row_template_display_cond1=>'EVEN_ROW_NUMBERS',
  p_row_template_display_cond2=>'ODD_ROW_NUMBERS',
  p_row_template_display_cond3=>'0',
  p_row_template_display_cond4=>'EVEN_ROW_NUMBERS',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 5,
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1065822217411647 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'<tr #HIGHLIGHT_ROW#>',
  p_row_template_after_last =>'</tr>');
exception when others then null;
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/report/value_attribute_pairs
prompt  ......report template 1065908223411647
 
begin
 
declare
  c1 varchar2(32767) := null;
  c2 varchar2(32767) := null;
  c3 varchar2(32767) := null;
  c4 varchar2(32767) := null;
begin
c1:=c1||'<tr><th class="t2header">#COLUMN_HEADER#</th><td class="t2data">#COLUMN_VALUE#</td></tr>';

c2 := null;
c3 := null;
c4 := null;
wwv_flow_api.create_row_template (
  p_id=> 1065908223411647 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_row_template_name=> 'Value Attribute Pairs',
  p_row_template1=> c1,
  p_row_template_condition1=> '',
  p_row_template2=> c2,
  p_row_template_condition2=> '',
  p_row_template3=> c3,
  p_row_template_condition3=> '',
  p_row_template4=> c4,
  p_row_template_condition4=> '',
  p_row_template_before_rows=>'<table cellpadding="0" border="0" cellspacing="0" summary="" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#">'||chr(10)||
'#TOP_PAGINATION#'||chr(10)||
'<tr><td><table cellpadding="0" cellspacing="0" border="0" summary="" class="t2ValueAttributePairs">',
  p_row_template_after_rows =>'</table><div class="t2CVS">#EXTERNAL_LINK##CSV_LINK#</div></td></tr>#PAGINATION#</table>',
  p_row_template_table_attr =>'OMIT',
  p_row_template_type =>'GENERIC_COLUMNS',
  p_column_heading_template=>'',
  p_row_template_display_cond1=>'0',
  p_row_template_display_cond2=>'0',
  p_row_template_display_cond3=>'NOT_CONDITIONAL',
  p_row_template_display_cond4=>'0',
  p_next_page_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_page_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS#</a>',
  p_next_set_template=>'<a href="#LINK#" class="t2pagination">#PAGINATION_NEXT_SET#<img src="#IMAGE_PREFIX#themes/theme_2/paginate_next.gif" alt="Next"></a>',
  p_previous_set_template=>'<a href="#LINK#" class="t2pagination"><img src="#IMAGE_PREFIX#themes/theme_2/paginate_prev.gif" alt="Previous">#PAGINATION_PREVIOUS_SET#</a>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 6,
  p_translate_this_template => 'N',
  p_row_template_comment=> '');
end;
null;
 
end;
/

 
begin
 
begin
wwv_flow_api.create_row_template_patch (
  p_id => 1065908223411647 + wwv_flow_api.g_id_offset,
  p_row_template_before_first =>'OMIT',
  p_row_template_after_last =>'<tr><td colspan="2" class="t2seperate"><hr /></td></tr>');
exception when others then null;
end;
null;
 
end;
/

prompt  ...label templates
--
--application/shared_components/user_interface/templates/label/no_label
prompt  ......label template 1066014829411648
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1066014829411648 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'No Label',
  p_template_body1=>'<span class="t2NoLabel">',
  p_template_body2=>'</span>',
  p_on_error_before_label=>'<div class="t2InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 13,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional
prompt  ......label template 1066116969411652
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1066116969411652 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t2Optional">',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'<div class="t2InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 3,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/optional_with_help
prompt  ......label template 1066210712411652
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1066210712411652 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Optional with Help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><a class="t2OptionalwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')" tabindex="999">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'<div class="t2InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 1,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required
prompt  ......label template 1066331910411652
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1066331910411652 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#" tabindex="999"><span class="t2Required"><img src="#IMAGE_PREFIX#themes/theme_2/required.gif" alt="Required Field Icon" style="margin-right:5px;" />',
  p_template_body2=>'</span></label>',
  p_on_error_before_label=>'<div class="t2InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 4,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/label/required_with_help
prompt  ......label template 1066400748411652
 
begin
 
begin
wwv_flow_api.create_field_template (
  p_id=> 1066400748411652 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_template_name=>'Required with help',
  p_template_body1=>'<label for="#CURRENT_ITEM_NAME#"><img src="#IMAGE_PREFIX#themes/theme_2/required.gif" alt="Required Field Icon" style="margin-right:5px;"/><a class="t2RequiredwithHelp" href="javascript:popupFieldHelp(''#CURRENT_ITEM_ID#'',''&SESSION.'')">',
  p_template_body2=>'</a></label>',
  p_on_error_before_label=>'<div class="t2InlineError">',
  p_on_error_after_label=>'<br/>#ERROR_MESSAGE#</div>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 2,
  p_translate_this_template=> 'N',
  p_template_comment=> '');
end;
null;
 
end;
/

prompt  ...breadcrumb templates
--
--application/shared_components/user_interface/templates/breadcrumb/breadcrumb_menu
prompt  ......template 1066516442411652
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 1066516442411652 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Breadcrumb Menu',
  p_before_first=>'<div class="t2BreadcrumbMenu">',
  p_current_page_option=>'<span class="t2current">#NAME#</span>',
  p_non_current_page_option=>'<a href="#LINK#">#NAME#</a>',
  p_menu_link_attributes=>'',
  p_between_levels=>'&nbsp;&gt;&nbsp;',
  p_after_last=>'</div>',
  p_max_levels=>12,
  p_start_with_node=>'PARENT_TO_LEAF',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/breadcrumb/hierarchical_menu
prompt  ......template 1066630140411653
 
begin
 
begin
wwv_flow_api.create_menu_template (
  p_id=> 1066630140411653 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_name=>'Hierarchical Menu',
  p_before_first=>'<ul class="t2HierarchicalMenu">',
  p_current_page_option=>'<li class="t2current">#NAME#</li>',
  p_non_current_page_option=>'<li><a href="#LINK#">#NAME#</a></li>',
  p_menu_link_attributes=>'',
  p_between_levels=>'',
  p_after_last=>'</ul>',
  p_max_levels=>11,
  p_start_with_node=>'CHILD_MENU',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 2,
  p_translate_this_template => 'N',
  p_template_comments=>'');
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/popuplov
prompt  ...popup list of values templates
--
prompt  ......template 1067307744411656
 
begin
 
begin
wwv_flow_api.create_popup_lov_template (
  p_id=> 1067307744411656 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_popup_icon=>'#IMAGE_PREFIX#list.gif',
  p_popup_icon_attr=>'width="13" height="13" alt="Popup Lov"',
  p_popup_icon2=>'',
  p_popup_icon_attr2=>'',
  p_page_name=>'winlov',
  p_page_title=>'Search Dialog',
  p_page_html_head=>'<link rel="stylesheet" href="#IMAGE_PREFIX#themes/theme_2/theme_3_1.css" type="text/css" />'||chr(10)||
'',
  p_page_body_attr=>'onload="first_field()" style="margin:0;"',
  p_before_field_text=>'<div class="t2PopupHead">',
  p_page_heading_text=>'',
  p_page_footer_text =>'',
  p_filter_width     =>'20',
  p_filter_max_width =>'100',
  p_filter_text_attr =>'',
  p_find_button_text =>'Search',
  p_find_button_image=>'',
  p_find_button_attr =>'',
  p_close_button_text=>'Close',
  p_close_button_image=>'',
  p_close_button_attr=>'',
  p_next_button_text =>'Next >',
  p_next_button_image=>'',
  p_next_button_attr =>'',
  p_prev_button_text =>'< Previous',
  p_prev_button_image=>'',
  p_prev_button_attr =>'',
  p_after_field_text=>'</div>',
  p_scrollbars=>'1',
  p_resizable=>'1',
  p_width =>'400',
  p_height=>'450',
  p_result_row_x_of_y=>'<br /><div style="padding:2px; font-size:8pt;">Row(s) #FIRST_ROW# - #LAST_ROW#</div>',
  p_result_rows_per_pg=>500,
  p_before_result_set=>'<div class="t2PopupBody">',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 1,
  p_translate_this_template => 'N',
  p_after_result_set   =>'</div>');
end;
null;
 
end;
/

prompt  ...calendar templates
--
--application/shared_components/user_interface/templates/calendar/calendar
prompt  ......template 1066703471411653
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 1066703471411653 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar',
  p_translate_this_template=> '',
  p_day_of_week_format=> '<th class="t2DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t2CalendarHolder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t2MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t2Calendar">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t2DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t2Day" valign="center" align="center">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="center" align="center" class="t2Today">',
  p_weekend_title_format=> '<div class="t2WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="center" class="t2WeekendDay" align="center">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t2NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t2NonDay" valign="center" align="center">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t2WeekCalendarHolder">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2MonthTitle" id="test">#WTITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td>',
  p_weekly_day_of_week_format => '<th class="t2DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t2WeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t2Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t2Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t2NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t2Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t2DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t2DayCalendarHolder"> <tr> <td class="t2MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'||chr(10)||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="2" summary="0" class="t2DayCalendar">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t2Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t2Today">',
  p_daily_time_open_format => '<th class="t2Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 1,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/calendar_alternative_1
prompt  ......template 1066918165411655
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 1066918165411655 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Calendar, Alternative 1',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th class="t2DayOfWeek">#IDAY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t2CalendarAlternative1Holder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t2MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="1" summary="0" class="t2CalendarAlternative1">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t2DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t2Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t2Today">',
  p_weekend_title_format=> '<div class="t2WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t2WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t2NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t2NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t2WeekCalendarAlternative1Holder">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2MonthTitle" id="test">#WTITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td>',
  p_weekly_day_of_week_format => '<th class="t2DayOfWeek">#IDAY#<br>#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="1" summary="0" class="t2WeekCalendarAlternative1">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t2Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t2Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t2NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t2Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t2DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t2DayCalendarAlternative1Holder"> <tr><td class="t2MonthTitle">#IMONTH# #DD#, #YYYY#</td></tr><tr><td>'||chr(10)||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="1" summary="0" class="t2DayCalendarAlternative1">',
  p_daily_month_close_format => '</table></td> </tr> </table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t2Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t2Today">',
  p_daily_time_open_format => '<th class="t2Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 2,
  p_reference_id=> null);
end;
null;
 
end;
/

--application/shared_components/user_interface/templates/calendar/small_calendar
prompt  ......template 1067108439411655
 
begin
 
begin
wwv_flow_api.create_calendar_template(
  p_id=> 1067108439411655 + wwv_flow_api.g_id_offset,
  p_flow_id=> wwv_flow.g_flow_id,
  p_cal_template_name=>'Small Calendar',
  p_translate_this_template=> 'N',
  p_day_of_week_format=> '<th class="t2DayOfWeek" height="12">#DY#</th>',
  p_month_title_format=> '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t2SmallCalendarHolder"> '||chr(10)||
' <tr>'||chr(10)||
'   <td class="t2MonthTitle">#IMONTH# #YYYY#</td>'||chr(10)||
' </tr>'||chr(10)||
' <tr>'||chr(10)||
' <td>',
  p_month_open_format=> '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t2SmallCalendar">',
  p_month_close_format=> '</table></td>'||chr(10)||
'</tr>'||chr(10)||
'</table>'||chr(10)||
'',
  p_day_title_format=> '<div class="t2DayTitle">#DD#</div>',
  p_day_open_format=> '<td class="t2Day" valign="top">',
  p_day_close_format=> '</td>',
  p_today_open_format=> '<td valign="top" class="t2Today">',
  p_weekend_title_format=> '<div class="t2WeekendDayTitle">#DD#</div>',
  p_weekend_open_format => '<td valign="top" class="t2WeekendDay">',
  p_weekend_close_format => '</td>',
  p_nonday_title_format => '<div class="t2NonDayTitle">#DD#</div>',
  p_nonday_open_format => '<td class="t2NonDay" valign="top">',
  p_nonday_close_format => '</td>',
  p_week_title_format => '',
  p_week_open_format => '<tr>',
  p_week_close_format => '</tr> ',
  p_daily_title_format => '<th width="14%" class="calheader">#IDAY#</th>',
  p_daily_open_format => '<tr>',
  p_daily_close_format => '</tr>',
  p_weekly_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t2SmallWeekCalendarHolder">'||chr(10)||
'<tr>'||chr(10)||
'<td class="t2MonthTitle" id="test">#WTITLE#</td>'||chr(10)||
'</tr>'||chr(10)||
'<tr>'||chr(10)||
'<td>',
  p_weekly_day_of_week_format => '<th class="t2DayOfWeek">#IDAY#<br />#MM#/#DD#</th>',
  p_weekly_month_open_format => '<table border="0" cellpadding="0" cellspacing="2" summary="0" class="t2SmallWeekCalendar">',
  p_weekly_month_close_format => '</table></td></tr></table>',
  p_weekly_day_title_format => '',
  p_weekly_day_open_format => '<td class="t2Day" valign="top">',
  p_weekly_day_close_format => '<br /></td>',
  p_weekly_today_open_format => '<td class="t2Today" valign="top">',
  p_weekly_weekend_title_format => '',
  p_weekly_weekend_open_format => '<td valign="top" class="t2NonDay">',
  p_weekly_weekend_close_format => '<br /></td>',
  p_weekly_time_open_format => '<th class="t2Hour">',
  p_weekly_time_close_format => '<br /></th>',
  p_weekly_time_title_format => '#TIME#',
  p_weekly_hour_open_format => '<tr>',
  p_weekly_hour_close_format => '</tr>',
  p_daily_day_of_week_format => '<th class="t2DayOfWeek">#IDAY# #DD#/#MM#</th>',
  p_daily_month_title_format => '<table cellspacing="0" cellpadding="0" border="0" summary="" class="t2SmallDayCalendarHolder"> <tr> <td class="t2MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr><tr><td>'||chr(10)||
'',
  p_daily_month_open_format => '<table border="0" cellpadding="2" cellspacing="2" summary="0" class="t2SmallDayCalendar">',
  p_daily_month_close_format => '</table></td></tr></table>',
  p_daily_day_title_format => '',
  p_daily_day_open_format => '<td valign="top" class="t2Day">',
  p_daily_day_close_format => '<br /></td>',
  p_daily_today_open_format => '<td valign="top" class="t2Today">',
  p_daily_time_open_format => '<th class="t2Hour">',
  p_daily_time_close_format => '<br /></th>',
  p_daily_time_title_format => '#TIME#',
  p_daily_hour_open_format => '<tr>',
  p_daily_hour_close_format => '</tr>',
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_class_id => 3,
  p_reference_id=> null);
end;
null;
 
end;
/

prompt  ...application themes
--
--application/shared_components/user_interface/themes/blue_and_tan
prompt  ......theme 1067403091411658
begin
wwv_flow_api.create_theme (
  p_id =>1067403091411658 + wwv_flow_api.g_id_offset,
  p_flow_id =>wwv_flow.g_flow_id,
  p_theme_id  => wwv_flow.g_flow_theme_id,
  p_theme_name=>'Blue and Tan',
  p_default_page_template=>1060523041411602 + wwv_flow_api.g_id_offset,
  p_error_template=>1060523041411602 + wwv_flow_api.g_id_offset,
  p_printer_friendly_template=>1060807996411603 + wwv_flow_api.g_id_offset,
  p_breadcrumb_display_point=>'REGION_POSITION_01',
  p_sidebar_display_point=>'REGION_POSITION_02',
  p_login_template=>1060209561411590 + wwv_flow_api.g_id_offset,
  p_default_button_template=>1061110998411604 + wwv_flow_api.g_id_offset,
  p_default_region_template=>1063030283411636 + wwv_flow_api.g_id_offset,
  p_default_chart_template =>1062108164411635 + wwv_flow_api.g_id_offset,
  p_default_form_template  =>1062221166411636 + wwv_flow_api.g_id_offset,
  p_default_reportr_template   =>1063030283411636 + wwv_flow_api.g_id_offset,
  p_default_tabform_template=>1063030283411636 + wwv_flow_api.g_id_offset,
  p_default_wizard_template=>1063511244411636 + wwv_flow_api.g_id_offset,
  p_default_menur_template=>1061722315411635 + wwv_flow_api.g_id_offset,
  p_default_listr_template=>1063030283411636 + wwv_flow_api.g_id_offset,
  p_default_report_template   =>1065603644411647 + wwv_flow_api.g_id_offset,
  p_default_label_template=>1066210712411652 + wwv_flow_api.g_id_offset,
  p_default_menu_template=>1066516442411652 + wwv_flow_api.g_id_offset,
  p_default_calendar_template=>1066703471411653 + wwv_flow_api.g_id_offset,
  p_default_list_template=>1065026387411644 + wwv_flow_api.g_id_offset,
  p_default_option_label=>1066210712411652 + wwv_flow_api.g_id_offset,
  p_default_required_label=>1066400748411652 + wwv_flow_api.g_id_offset);
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
