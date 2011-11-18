{if !empty($thumbnails)}
  {foreach from=$thumbnails item=thumbnail name="thumb_loop"}
  <figure class="picture_item">
    <a href="{$thumbnail.URL}">
      <img class="thumbnail" src="{$thumbnail.TN_SRC}" alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}">
    </a>
    {if $SHOW_THUMBNAIL_CAPTION }
      <figcaption>
        {if !empty($thumbnail.icon_ts)}<span class="icon new"></span>{/if}
        {$thumbnail.NAME}
        <br>
        {if isset($thumbnail.NB_COMMENTS)}
        <span class="small icon comment" title="{$pwg->l10n_dec('%d comment', '%d comments',$thumbnail.NB_COMMENTS)}">
          {$thumbnail.NB_COMMENTS}
        </span>
        {/if}
        {if isset($thumbnail.NB_HITS)}
	<span class="small icon eye" title="{$pwg->l10n_dec('%d hit', '%d hits',$thumbnail.NB_HITS)}">
          {$thumbnail.NB_HITS}
        </span>
        {/if}
      </figcaption>
    {/if}
  </figure>
  {/foreach}
{/if}
