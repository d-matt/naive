<h3>{'Related tags'|@translate}</h3>
<ul id="menuTagCloud">
  {foreach from=$block->data item=tag}
  <li>{strip}
    <a class="tagLevel{$tag.level}" href=
    {if isset($tag.U_ADD)}
        "{$tag.U_ADD}" title="{$pwg->l10n_dec('%d photo is also linked to current tags', '%d photos are also linked to current tags', $tag.counter)}" rel="nofollow">+
    {else}
        "{$tag.URL}" title="{'display photos linked to this tag'|@translate}">
    {/if}
        {$tag.name}
      </a>
  </li>{/strip}
{* ABOVE there should be no space between text, </a> and </span> elements to avoid IE8 bug https://connect.microsoft.com/IE/feedback/ViewFeedback.aspx?FeedbackID=366567 *}
   {/foreach}
</ul>
