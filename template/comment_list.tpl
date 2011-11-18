<ul class="comment_list">
{foreach from=$comments item=comment name=comment_loop}
  <li>
    <div class="comment {if $smarty.foreach.comment_loop.index is odd}odd{else}even{/if}">
    {if isset($comment.TN_SRC)}
      <div class="illustration">
        <a href="{$comment.U_PICTURE}"><img src="{$comment.TN_SRC}" alt="{$comment.ALT}"></a>
      </div>
    {/if}
    {if isset($comment.U_DELETE) or isset($comment.U_VALIDATE) or isset($comment.U_EDIT) }
      <div class="actions">
      {if isset($comment.U_DELETE)}
        <a class="icon x" href="{$comment.U_DELETE}" title="{'delete this comment'|@translate}" onclick="return confirm('{'Are you sure?'|@translate|@escape:javascript}');">delete</a>
      {/if}
      {if isset($comment.U_EDIT) and !isset($comment.IN_EDIT)}
        <a class="editComment icon pen" href="{$comment.U_EDIT}#edit_comment" title="{'edit this comment'|@translate}">edit</a>
      {/if}
      {if isset($comment.U_VALIDATE)}
        <a class="icon check" href="{$comment.U_VALIDATE}" title="{'validate this comment'|@translate}">validate</a>
      {/if}
      </div>
    {/if}
    {if isset($comment.IN_EDIT)}
      <a name="edit_comment"></a>
      <form  method="post" action="{$comment.U_EDIT}" class="filter" id="editComment">
        <fieldset>
          <legend>{'Edit a comment'|@translate}</legend>
          <label>{'Comment'|@translate}</label>
          <textarea name="content" id="contenteditid">{$comment.CONTENT|@escape}</textarea>
          <input type="hidden" name="key" value="{$comment.KEY}">
          <input type="hidden" name="image_id" value="{$comment.IMAGE_ID|@default:$current.id}">
          <button class="submit icon check" type="submit">{'Submit'|@translate}</button>
          <button class="icon x">{'Cancel'|@translate}</button>
        </fieldset>
      </form>
    {else}
      <blockquote>
        {$comment.CONTENT}
      </blockquote>
      <span class="author">{$comment.AUTHOR}</span> - <span class="date">{$comment.DATE}</span>
    {/if}
    </div>
  </li>
{/foreach}
</ul>
