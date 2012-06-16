<figure id="image_wrapper" style="max-width:{$WIDTH_IMG}px;">
  {if isset($previous)}<div id="go_to_prev_holder"></div>{/if}
  <img id="subject" src="{$SRC_IMG}" alt="{$ALT_IMG}">
  {if isset($next)}<div id="go_to_next_holder"></div>{/if}
  <figcaption>
    <div class="imageNumber right">{$PHOTO}</div>
    {$current.TITLE|@replace:'"':' '}
    {if isset($COMMENT_IMG)}
    <blockquote>{$COMMENT_IMG|@strip_tags:false|@replace:'"':' '}</blockquote>
    {/if}
  </figcaption>
</figure>
