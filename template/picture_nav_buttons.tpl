{if $DISPLAY_NAV_BUTTONS}
<div class="navButtons">
  {if isset($slideshow)}
    {if isset($U_SLIDESHOW_STOP)}
  <a id="start_stop_slideshow" href="{$U_SLIDESHOW_STOP}" title="{'stop the slideshow'|@translate}">{'Stop'|@translate}</a>
    {/if}
    {if isset($slideshow.U_START_PLAY)}
  <a id="play_pause" href="{$slideshow.U_START_PLAY}" title="{'Play of slideshow'|@translate}">Play</a>
    {/if}
    {if isset($slideshow.U_STOP_PLAY)}
  <a id="play_pause" href="{$slideshow.U_STOP_PLAY}" title="{'Pause of slideshow'|@translate}">Pause</a>
    {/if}
    {if isset($slideshow.U_DEC_PERIOD)}
  <a id="increase_freq" href="{$slideshow.U_DEC_PERIOD}" title="{'Accelerate diaporama speed'|@translate}">&nbsp;+&nbsp;</a>
    {else}
  &nbsp;+&nbsp;
    {/if}
    {if isset($slideshow.U_INC_PERIOD)}
  <a id="decrease_freq" href="{$slideshow.U_INC_PERIOD}" title="{'Reduce diaporama speed'|@translate}">&nbsp;-&nbsp;</a>
    {else}
  &nbsp;-&nbsp;
    {/if}
  {/if}
  {if isset($first)}
  <span id="first_button">
    <a id="first_pict" href="{$first.U_IMG}" title="{'First'|@translate} : {$first.TITLE}" rel="start">&laquo;</a>
  </span>
  {else}
  <span id="first_button">
    &laquo;
  </span>
  {/if}
  {if isset($previous)}
  <span id="go_to_prev">
    <a id="prev_pict" href="{$previous.U_IMG}" title="{'Previous'|@translate} : {$previous.TITLE}" rel="prev">&lsaquo;</a>
  </span>
  {else}
  <span id="go_to_prev">
    &lsaquo;
  </span>
  {/if}
  {if isset($next)}
  <span id="go_to_next">
    <a id="next_pict" href="{$next.U_IMG}" title="{'Next'|@translate} : {$next.TITLE}" rel="next">&rsaquo;</a>
  </span>
  {else}
  <span id="go_to_next">
    &rsaquo;
  </span>
  {/if}
  {if isset($last)}
  <span id="last_button">
    <a id="last_pict" href="{$last.U_IMG}" title="{'Last'|@translate} : {$last.TITLE}" rel="last">&raquo;</a>
  </span>
  {else}
  <span id="last_button">
    &raquo;
  </span>
  {/if}
</div>
{/if}
