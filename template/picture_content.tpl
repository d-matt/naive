{assign var='size' value=$current.selected_derivative->get_size()}
<figure id="image_wrapper" style="max-width:{$size[0]}px;">
  {if isset($previous)}<div id="go_to_prev_holder"></div>{/if}
  <img id="subject" src="{$current.selected_derivative->get_url()}" alt="{$ALT_IMG}">
  {if isset($next)}<div id="go_to_next_holder"></div>{/if}
  <figcaption>
    <div class="imageNumber right">{$PHOTO}</div>
    {$current.TITLE|@replace:'"':' '}
    {if isset($COMMENT_IMG)}
    <blockquote>{$COMMENT_IMG|@strip_tags:false|@replace:'"':' '}</blockquote>
    {/if}
  </figcaption>
</figure>
