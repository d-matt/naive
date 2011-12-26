{if $id == "quickconnect"}
  {assign var='legend' value='Quick connect'|@translate}
{else}
  {assign var='legend' value='Connection settings'|@translate}
{/if}
<form method="post" action="{$U_LOGIN}" id="{$id}">
  <fieldset>
    <legend>{$legend}</legend>
    <ul>
      <li>
        <label for="quick_username">{'Username'|@translate}</label>
        <input type="text" name="username" id="quick_username" value=""/>
      </li>
      <li>
        <label for="quick_password">{'Password'|@translate}</label>
        <input type="password" name="password" id="quick_password"/>
      </li>
      {if $AUTHORIZE_REMEMBERING}
      <li>
        <label for="quick_remember_me">
          {'Auto login'|@translate}
          <input type="checkbox" name="remember_me" id="quick_remember_me" value="1"/>
        </label>
      </li>
      {/if}
    </ul>
    <p class="clear"> 
      <input type="hidden" name="redirect" 
        {if isset($U_REDIRECT)} 
          value="{$U_REDIRECT|@urlencode}"
        {else}
          value="{$smarty.server.REQUEST_URI|@urlencode}"
        {/if}>
      <button class="submit icon check" type="submit" name="login">{'Submit'|@translate}</button>
    </p>
    <ul class="arrow_list right">
      {if isset($U_REGISTER)}
      <li><a href="{$U_REGISTER}">{'Create a new account'|@translate}</a></li>
      {/if}
      <li><a href="{$U_LOST_PASSWORD}">{'Forgot your password?'|@translate}</a></li>
    </ul>
  </fieldset>
</form>
