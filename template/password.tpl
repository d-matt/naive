{if isset($MENUBAR)}{$MENUBAR}{/if}
<div id="content">
  <div class="titrePage">
    <h2><a href="{$U_HOME}" title="{'Home'|@translate}">{'Home'|@translate}</a> / {$title}</h2>
  </div>

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
    <input class="submit" type="submit" name="submit" value="{'Change my password'|@translate}">
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
    <input class="submit" type="submit" name="submit" value="{'Submit'|@translate}">
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
