{if isset($MENUBAR)}{$MENUBAR}{/if}
<div id="content" class="2_col">
  <div class="titrePage">
    <h2><a href="{$U_HOME}" title="{'Home'|@translate}">{'Home'|@translate}</a> / {'Identification'|@translate}</h2>
  </div>
  <form action="{$F_LOGIN_ACTION}" method="post" name="login_form" id="login_form">
    <fieldset>
      <legend>{'Connection settings'|@translate}</legend>
      <p>
        <label for="username">{'Username'|@translate}</label>
        <input tabindex="1" class="login" type="text" name="username" id="username" size="25" maxlength="40"/>
      </p>
      <p>
        <label for="password">{'Password'|@translate}</label>
        <input tabindex="2" class="login" type="password" name="password" id="password" size="25" maxlength="25"/>
      <p>
      {if $authorize_remembering }
      <p>
        <input tabindex="3" type="checkbox" name="remember_me" id="remember_me" value="1"/>
        <label for="remember_me" class="inline">
          {'Auto login'|@translate}
        </label>
      </p>
      {/if}
    </fieldset>
    <p>
      <input type="hidden" name="redirect" value="{$U_REDIRECT|@urlencode}"/>
      <input class="submit" tabindex="4" type="submit" name="login" value="{'Submit'|@translate}"/>
    </p>
    <ul class="right">
      {if isset($U_REGISTER)}
      <li><a href="{$U_REGISTER}">{'Register'|@translate}</a></li>
      {/if}
      <li><a href="{$U_LOST_PASSWORD}">{'Forgot your password?'|@translate}</a></li>
    </ul>
  </form>
  <div class="clear"></div>
</div> <!-- content -->
