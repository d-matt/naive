<?php
/*
Theme Name: Naive
Version: 0.6
Description: Naive theme
Theme URI: http://piwigo.org/ext/extension_view.php?eid=593
Author: d-matt
Author URI: https://github.com/d-matt/naive
*/

$themeconf = array(
  'parent' => 'default',
  'load_parent_css' => false,
  'load_parent_local_head' => false,
  'name' => 'Naive',
  'theme_dir' => 'naive',
  'icon_dir' => 'themes/naive/icon',
  'admin_icon_dir' => 'themes/default/icon/admin',
  'mime_icon_dir' => 'themes/default/icon/mimetypes/',
  'local_head' => 'local_head.tpl',
  'url' => 'https://github.com/d-matt/naive'
);

load_language('theme.lang', PHPWG_THEMES_PATH.'naive/');

// debug - do not combine files
$conf['template_combine_files'] = false;
?>
