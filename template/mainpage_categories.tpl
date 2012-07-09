{define_derivative name='derivative_params' width=125 height=125 crop=true}
{foreach from=$category_thumbnails item=cat name="cat_loop"}
<figure class="category">
  <a href="{$cat.URL}">
    <img class="left thumbnail" src="{$pwg->derivative_url($derivative_params, $cat.representative.src_image)}" alt="{$cat.TN_ALT}" title="{$cat.NAME|@replace:'"':' '|@strip_tags:false} - {'display this album'|@translate}">
  </a>
  <figcaption>
    <h3>
      <a href="{$cat.URL}">{$cat.NAME}</a>
      {if !empty($cat.icon_ts)}
      <span class="icon new"></span>
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
