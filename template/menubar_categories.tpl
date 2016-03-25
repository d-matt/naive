<h3>
  <a href="{$block->data.U_CATEGORIES}">{'Albums'|@translate}</a>
  <span class="small">
  {if isset($U_START_FILTER)}
    (<a href="{$U_START_FILTER}" title="{'display only recently posted photos'|@translate}" rel="nofollow">filter new</a>)
  {/if}
  {if isset($U_STOP_FILTER)}
    (<a href="{$U_STOP_FILTER}" title="{'return to the display of all photos'|@translate}">show all</a>)
  {/if}
  </span>
</h3>
{assign var='ref_level' value=0}
{foreach from=$block->data.MENU_CATEGORIES item=cat}
  {if $cat.LEVEL > $ref_level}
<ul>
  {else}
  </li>
  {'</ul></li>'|str_repeat:($ref_level-$cat.LEVEL)}
  {/if}
  <li {if $cat.SELECTED}class="selected"{/if}>
    <a href="{$cat.URL}" {if $cat.IS_UPPERCAT}rel="up"{/if} title="{$cat.TITLE}">{$cat.NAME}</a>
    {if $cat.count_images > 0}
    <span class="{if $cat.nb_images > 0}menuInfoCat{else}menuInfoCatByChild{/if}" title="{$cat.TITLE}">[{$cat.count_images}]</span>
    {/if}
    {if !empty($cat.icon_ts)}
    <span class="icon new"></span>
    {/if}
  {assign var='ref_level' value=$cat.LEVEL}
{/foreach}
{'</li></ul>'|@str_repeat:$ref_level}
<p class="totalImages">{$block->data.NB_PICTURE|@translate_dec:'%d photo':'%d photos'}</p>
