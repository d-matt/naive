{if isset($MENUBAR)}{$MENUBAR}{/if}
<div id="content">
  <div class="titrePage">
    <h2><a href="{$U_HOME}" title="{'Home'|@translate}">{'Home'|@translate}</a> / {'Registration'|@translate}</h2>
  </div>

{if isset($errors)}
  <div class="errors">
    <ul>
      {foreach from=$errors item=error}
      <li>{$error}</li>
      {/foreach}
    </ul>
  </div>
{/if}

  <form method="post" action="{$F_ACTION}" class="properties" name="register_form" id="register_form">
    <fieldset>
      <legend>{'Enter your personnal informations'|@translate}</legend>
      <ul>
        <li>
          <label for="login">{'Username'|@translate}</label>
          <input type="text" name="login" id="login" value="{$F_LOGIN}" required>
        </li>
        <li>
          <label for="password">{'Password'|@translate}</label>
          <input type="password" name="password" id="password" required>
        </li>
        <li>
          <label for="password_conf">{'Confirm Password'|@translate}</label>
          <input type="password" name="password_conf" id="password_conf" required>
        </li>
        <li>
          <label for="mail_address">{'Email address'|@translate}</label>
          <input type="text" name="mail_address" id="mail_address" value="{$F_EMAIL}">
          {if ($main.obligatory_user_mail_address)}
            ({'useful when password forgotten'|@translate})
          {/if}
        </li>
      </ul>
    </fieldset>
    <p class="bottomButtons">
      <input type="hidden" name="key" value="{$F_KEY}" >
      <button class="submit icon check" type="submit" name="submit">{'Register'|@translate}</button>
      <button class="submit icon x" type="reset">{'Reset'|@translate}</button>
    </p>
  </form>
  <script type="text/javascript"><!--
    document.register_form.login.focus();
  //--></script>
</div> <!-- content -->
