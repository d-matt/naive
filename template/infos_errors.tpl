{if isset($errors) and count($errors) > 0}
<div class="error">
  <ul>
    {foreach from=$errors item=error}
    <li>{$error}</li>
    {/foreach}
  </ul>
</div>
{/if}
{if isset($infos) and count($infos) > 0}
<div class="notice">
  <ul>
    {foreach from=$infos item=info}
    <li>{$info}</li>
    {/foreach}
  </ul>
</div>
{/if}

