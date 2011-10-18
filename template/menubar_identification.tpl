{if isset($U_LOGIN)}
<form method="post" action="{$U_LOGIN}" id="quickconnect">
  <fieldset>
    <legend>{'Quick connect'|@translate}</legend>
    <p>
      <label for="quick_username">{'Username'|@translate}</label>
      <input type="text" name="username" id="quick_username" value=""/>
      <label for="quick_password">{'Password'|@translate}</label>
      <input type="password" name="password" id="quick_password"/>

      {if $AUTHORIZE_REMEMBERING}
      <label for="quick_remember_me" class="inline">{'Auto login'|@translate}</label>
      <input type="checkbox" name="remember_me" id="quick_remember_me" value="1"/>
      {/if}
  
      <input type="hidden" name="redirect" value="{$smarty.server.REQUEST_URI|@urlencode}"/>
    </p>
    <p>
      <input type="submit" name="login" value="{'Submit'|@translate}"/>
    </p>
    <ul class="categoryActions">
    {if isset($U_REGISTER)}
      <li><a href="{$U_REGISTER}">{'Create a new account'|@translate}</a></li>
    {/if}
      <li><a href="{$U_LOST_PASSWORD}">{'Forgot your password?'|@translate}</a></li>
    </ul>
  </fieldset>
</form>
{else}
<h3>{'Identification'|@translate}</h3>
<ul>
{if isset($U_LOGOUT)}
  <li><a href="{$U_LOGOUT}">{'Logout'|@translate}</a></li>
{/if}
{if isset($U_PROFILE)}
  <li><a href="{$U_PROFILE}" title="{'customize the appareance of the gallery'|@translate}">{'Customize'|@translate}</a></li>
{/if}
{if isset($U_ADMIN)}
  <li><a href="{$U_ADMIN}" title="{'available for administrators only'|@translate}">{'Administration'|@translate}</a></li>
{/if}
</ul>
{/if}
