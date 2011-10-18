{if !empty($thumbnails)}
  {foreach from=$thumbnails item=thumbnail name="thumb_loop"}
  <figure class="picture_item">
    <a href="{$thumbnail.URL}">
      <img class="thumbnail" src="{$thumbnail.TN_SRC}" alt="{$thumbnail.TN_ALT}" title="{$thumbnail.TN_TITLE}">
    </a>
    {* --- In order for download multi plugin to work, the $thumbnail.NAME MUST be set with the thmbnail .... ---*}
    {if isset($thumbnail.NAME)}<figcaption>{$thumbnail.NAME}</figcaption>{/if}
  </figure>
  {/foreach}
{/if}
