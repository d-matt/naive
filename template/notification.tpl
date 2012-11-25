{html_head} 
<link rel="alternate" type="application/rss+xml" title="{'Photos only RSS feed'|@translate}" href="{$U_FEED_IMAGE_ONLY}"> 
<link rel="alternate" type="application/rss+xml" title="{'Complete RSS feed (photos, comments)'|@translate}" href="{$U_FEED}"> 
{/html_head} 
{if isset($MENUBAR)}{$MENUBAR}{/if}
<div id="content" class="two_col">
  <div class="titrePage">
    <h2><a href="{$U_HOME}" title="{'Home'|@translate}">{'Home'|@translate}</a> / {'Notification'|@translate}</h2>
  </div>

  {include file='infos_errors.tpl'}

  <p>{'The RSS notification feed provides notification on news from this website : new photos, updated albums, new comments. Use a RSS feed reader.'|@translate}</p>

  <ul>
    <li><a href="{$U_FEED_IMAGE_ONLY}" class="icon rss">{'Photos only RSS feed'|@translate}</a></li>
    <li><a href="{$U_FEED}" class="icon rss">{'Complete RSS feed (photos, comments)'|@translate}</a></li>
  </ul>
  <div class="clear"></div>
</div>
