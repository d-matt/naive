{if isset($U_LOGIN)}
{include file='id_form.tpl' id="quickconnect"}
{else}
<h3>{'Identification'|@translate}</h3>
<ul>
{if isset($U_LOGOUT)}
  <li><a href="{$U_LOGOUT}">{'Logout'|@translate}</a></li>
{/if}
{if isset($U_PROFILE)}
  <li><a href="{$U_PROFILE}" title="{'customize the appareance of the gallery'|@translate}">{'Customize'|@translate}</a></li>
{/if}
{if isset($U_ADMIN)}
  <li><a href="{$U_ADMIN}" title="{'available for administrators only'|@translate}">{'Administration'|@translate}</a></li>
{/if}
</ul>
{/if}
