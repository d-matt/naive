{if isset($MENUBAR)}{$MENUBAR}{/if}
<div id="content" class="two_col">
  <div class="titrePage">
    <h2><a href="{$U_HOME}" title="{'Home'|@translate}">{'Home'|@translate}</a> / {$title}</h2>
  </div>

{include file='infos_errors.tpl'}

{if $action ne 'none'}
  <form id="lostPassword" action="{$form_action}?action={$action}{if isset($key)}&amp;key={$key}{/if}" method="post">
    <input type="hidden" name="pwg_token" value="{$PWG_TOKEN}">

    {if $action eq 'lost'}
    <p>
      {'Please enter your username or email address.'|@translate} {'You will receive a link to create a new password via email.'|@translate}
    </p>
    <p class="inline_fields">
      <label>{'Username or email'|@translate} : </label>
      <input type="text" id="username_or_email" name="username_or_email" {if isset($username_or_email)} value="{$username_or_email}"{/if}>
    </p>
    <button class="submit icon check" type="submit" name="submit">{'Change my password'|@translate}</button>
    {elseif $action eq 'reset'}
    <p>{'Hello'|@translate} <em>{$username}</em>. {'Enter your new password below.'|@translate}</p>
    <p>
      <label>{'New password'|@translate}</label>
      <input type="password" name="use_new_pwd" id="use_new_pwd" value="">
    </p>
    <p>
      <label>{'Confirm Password'|@translate}</label>
      <input type="password" name="passwordConf" id="passwordConf" value="">
    </p>
    <button class="submit icon check" type="submit" name="submit">{'Submit'|@translate}</button>
    {/if}
  </form>
{/if} {* $action ne 'none' *}

  <script type="text/javascript">
  {if $action eq 'lost'}
    {literal}try{document.getElementById('username_or_email').focus();}catch(e){}{/literal}
    {elseif $action eq 'reset'}
    {literal}try{document.getElementById('use_new_pwd').focus();}catch(e){}{/literal}
  {/if}
  </script>
</div> <!-- content -->
