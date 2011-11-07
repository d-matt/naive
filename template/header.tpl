<!DOCTYPE html>
<html lang="{$lang_info.code}" dir="{$lang_info.direction}">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset={$CONTENT_ENCODING}">
  <meta name="generator" content="Piwigo (aka PWG), see piwigo.org">
  {if isset($meta_ref) } 
    {if isset($INFO_AUTHOR)}
  <meta name="author" content="{$INFO_AUTHOR|@strip_tags:false|@replace:'"':' '}">
    {/if}
    {if isset($related_tags)}
  <meta name="keywords" content="{foreach from=$related_tags item=tag name=tag_loop}{if !$smarty.foreach.tag_loop.first}, {/if}{$tag.name}{/foreach}">
    {/if}
    {if isset($COMMENT_IMG)}
  <meta name="description" content="{$COMMENT_IMG|@strip_tags:false|@replace:'"':' '}{if isset($INFO_FILE)} - {$INFO_FILE}{/if}">
    {else}
  <meta name="description" content="{$PAGE_TITLE}{if isset($INFO_FILE)} - {$INFO_FILE}{/if}">
    {/if}
  {/if}

  {if not empty($page_refresh)}<meta http-equiv="refresh" content="{$page_refresh.TIME};url={$page_refresh.U_REFRESH}">{/if}

  {if (isset($REVERSE) and $REVERSE and $PAGE_TITLE == l10n('Home'))}
  <title>{$GALLERY_TITLE} | {$PAGE_TITLE}</title>
  {else}
  <title>{$PAGE_TITLE} | {$GALLERY_TITLE}</title>
  {/if}
  <link rel="icon" type="image/x-icon" href="{$ROOT_URL}{$themeconf.icon_dir}/favicon.ico">
  <link rel="start" title="{'Home'|@translate}" href="{$U_HOME}" >
  <link rel="search" title="{'Search'|@translate}" href="{$ROOT_URL}search.php" >
  {if isset($first.U_IMG)   }<link rel="start" title="{'First'|@translate}" href="{$first.U_IMG}" >{/if}
  {if isset($previous.U_IMG)}<link rel="prev" title="{'Previous'|@translate}" href="{$previous.U_IMG}" >{/if}
  {if isset($next.U_IMG)    }<link rel="next" title="{'Next'|@translate}" href="{$next.U_IMG}" >{/if}
  {if isset($U_UP)          }<link rel="index" title="{'Thumbnails'|@translate}" href="{$U_UP}" >{/if}
  {if isset($U_PREFETCH)    }<link rel="prefetch" href="{$U_PREFETCH}">{/if}

{* get_combined_css HAS to be on first col, otherwise LocalFile Editor Plugin 
   won't be able to place its rules ... (!!) *}
{get_combined_css}
  {combine_css path="themes/naive/css/blueprint/screen.css" order=-10}
  {combine_css path="themes/naive/css/styles.css" order=-10}
  {foreach from=$themes item=theme}
    {if $theme.load_css}
      {combine_css path="themes/`$theme.id`/theme.css" order=-10}
      
    {/if}
  {if !empty($theme.local_head)}{include file=$theme.local_head load_css=$theme.load_css}{/if}
  {/foreach}

{* less style sheet *}
{*
  <link rel="stylesheet/less" type="text/css" href="themes/naive/css/styles.less">
  <script src="themes/naive/js/less-1.1.3.min.js" type="text/javascript"></script>
*}
  {get_combined_scripts load='header'}
  <!--[if lt IE 7]>
  <script type="text/javascript" src="{$ROOT_URL}themes/default/js/pngfix.js"></script>
  <![endif]-->
  {combine_script id='jquery' path='themes/default/js/jquery.min.js'}
  {combine_script id='core.scripts' path='themes/default/js/scripts.js'}
  {combine_script id='jquery.cookie' path='themes/naive/js/jquery.cookie.min.js'}
  {combine_script id='naive.scripts' path='themes/naive/js/scripts.js'}
  {combine_script id='naive.patches' path='themes/naive/js/patches.js'}

  {if not empty($head_elements)}
    {foreach from=$head_elements item=elt}
      {$elt}
    {/foreach}
  {/if}
</head>
<body>
  <div id="the_page">
{if !empty($PLUGIN_INDEX_CONTENT_BEFORE)}{$PLUGIN_INDEX_CONTENT_BEFORE}{/if}
    <header>
      {if not empty($header_msgs)}
      <div class="header_msgs">
        {foreach from=$header_msgs item=elt}
	  {$elt}
          <br>
        {/foreach}
      </div>
      {/if}

      <div id="theHeader">{$PAGE_BANNER}</div>
      {if isset($theSwiftHeader)}{$theSwiftHeader}{/if}
      {if not empty($header_notes)}
      <div class="header_notes">
        {foreach from=$header_notes item=elt}
        <p>{$elt}</p>
        {/foreach}
      </div>
      {/if}
{* --- Category Actions --- *}
      <ul class="categoryActions">
      {if isset($U_EDIT) or isset($U_SLIDESHOW) or !empty($PLUGIN_INDEX_ACTIONS)}
      {* the ul element is outside the if statement as it is potentially an
         anchor used by a javascript chunk to place actions from other pages *}
        {if isset($U_EDIT)}
        <li><a href="{$U_EDIT}" title="{'edit album informations'|@translate}">{'edit'|@translate}</a></li>
        {/if}
        {if isset($U_SLIDESHOW)}
        <li><a href="{$U_SLIDESHOW}" title="{'slideshow'|@translate}" rel="nofollow">{'slideshow'|@translate}</a></li>
        {/if}
        {if !empty($PLUGIN_INDEX_ACTIONS)}{$PLUGIN_INDEX_ACTIONS}{/if}
      {/if}
      </ul>
{* --- Title (breadcrumb) --- *}
      {* The following is a terible hack ! as $TITLE will be used on the category pages 
         and $SECTION_TITLE on picture pages ... *}
      <h2>{$TITLE}{$SECTION_TITLE}{if isset($chronology.TITLE)} / {$chronology.TITLE}{/if}</h2>
    </header>
    {if isset($errors)}
    <div class="error">
      <ul>
        {foreach from=$errors item=error}
        <li>{$error}</li>
        {/foreach}
      </ul>
    </div>
    {/if}
    {if isset($infos)}
    <div class="notice">
      <ul>
        {foreach from=$infos item=info}
        <li>{$info}</li>
        {/foreach}
      </ul>
    </div>
    {/if}
