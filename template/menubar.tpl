{if !empty($blocks) }
<nav id="menubar">
  {foreach from=$blocks key=id item=block}
  <div id="{$id}">
    {if not empty($block->template)}
    {include file=$block->template|@get_extent:$id }
    {else}
    {$block->raw_content}
    {/if}
  </div>
  {/foreach}
</nav>
<div id="menuswitcher" role="button" class="hidden">&laquo;</div>
{/if}
