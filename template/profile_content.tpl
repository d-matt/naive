<form method="post" name="profile" action="{$F_ACTION}" id="profile" class="properties">
  <fieldset>
    <legend>{'Registration'|@translate}</legend>
    <input type="hidden" name="redirect" value="{$REDIRECT}">
    <ul>
      <li>
        <label>{'Username'|@translate}</label>
        <input type="text" readonly="readonly" disabled="disabled" value="{$USERNAME}">
      </li>
      {if not $SPECIAL_USER} {* can modify password + email*}
      <li>
        <label for="mail_address">{'Email address'|@translate}</label>
        <input type="text" name="mail_address" id="mail_address" value="{$EMAIL}">
      </li>
      {if not $IN_ADMIN} {* admins do not need old password*}
      <li>
        <label for="password">{'Password'|@translate}</label>
        <input type="password" name="password" id="password" value="">
      </li>
      {/if}
      <li>
        <label for="use_new_pwd">{'New password'|@translate}</label>
        <input type="password" name="use_new_pwd" id="use_new_pwd" value="">
      </li>
      <li>
        <label for="passwordConf">{'Confirm Password'|@translate}</label>
        <input type="password" name="passwordConf" id="passwordConf" value="">
      </li>
      {/if}
    </ul>
  </fieldset>
  {if $ALLOW_USER_CUSTOMIZATION}
  <fieldset>
    <legend>{'Preferences'|@translate}</legend>
    <ul>
      <li>
        <label for="nb_image_page">{'Number of photos per page'|@translate}</label>
        <input type="text" size="3" maxlength="2" name="nb_image_page" id="nb_image_page" value="{$NB_IMAGE_PAGE}">
      </li>
      <li>
        <label for="template">{'Interface theme'|@translate}</label>
        {html_options name=theme options=$template_options selected=$template_selection}
      </li>
      <li>
        <label for="Language">{'Language'|@translate}</label>
        {html_options name=language options=$language_options selected=$language_selection}
      </li>
      <li>
        <label for="Recent period">{'Recent period'|@translate}</label>
        <input type="text" size="3" maxlength="2" name="recent_period" id="recent_period" value="{$RECENT_PERIOD}">
      </li>
      <li>
        <label>{'Expand all albums'|@translate}</label>
        <input type="checkbox" name="expand"  value="true" {if $EXPAND eq 'true'}checked="checked"{/if}>
      </li>
      <li>
        <label>{'Show number of comments'|@translate}</label>
        <input type="checkbox" name="show_nb_comments"  value="true" {if $NB_COMMENTS eq 'true'}checked="checked"{/if}>
      </li>
      <li>
        <label>{'Show number of hits'|@translate}</label>
        <input type="checkbox" name="show_nb_hits"  value="true" {if $NB_HITS eq 'true'}checked="checked"{/if}>
      </li>
      <li>
        <label for="maxwidth">{'Maximum photo width'|@translate}</label>
        <input type="text" size="4" maxlength="4" name="maxwidth" id="maxwidth" value="{$MAXWIDTH}">
      </li>
      <li>
        <label for="maxheight">{'Maximum photo height'|@translate}</label>
        <input type="text" size="4" maxlength="4" name="maxheight" id="maxheight" value="{$MAXHEIGHT}">
      </li>
    </ul>
  </fieldset>
  {/if}

  <p class="bottomButtons">
    <input type="hidden" name="pwg_token" value="{$PWG_TOKEN}">
    <input class="submit" type="submit" name="validate" value="{'Submit'|@translate}">
    <input class="submit" type="reset" name="reset" value="{'Reset'|@translate}">
    {if $ALLOW_USER_CUSTOMIZATION}
    <input class="submit" type="submit" name="reset_to_default" value="{'Reset to default values'|@translate}">
    {/if}
  </p>

</form>
