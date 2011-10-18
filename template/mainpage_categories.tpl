{foreach from=$category_thumbnails item=cat name="cat_loop"}
<figure class="category">
  <a href="{$cat.URL}">
    <img class="left thumbnail" src="{$cat.TN_SRC}" alt="{$cat.TN_ALT}" title="{$cat.NAME|@replace:'"':' '} - {'display this album'|@translate}">
  </a>
  <figcaption>
    <h3>
      <a href="{$cat.URL}">{$cat.NAME}</a>
      {if !empty($cat.icon_ts)}
      <span class="new">&#9733;</span>
      {/if}
    </h3>
    {if isset($cat.INFO_DATES) }
    <p class="dates">{$cat.INFO_DATES}</p>
    {/if}
    <p class="Nb_images">{$cat.CAPTION_NB_IMAGES}</p>
    {if not empty($cat.DESCRIPTION)}
    <p>{$cat.DESCRIPTION|truncate:200:" [...]"}</p>
    {/if}
  </figcaption>
</figure>
{/foreach}
