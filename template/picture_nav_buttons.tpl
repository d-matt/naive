{if $DISPLAY_NAV_BUTTONS}
<div class="navButtons">
  {if isset($slideshow)}
    {if isset($U_SLIDESHOW_STOP)}
  <a id="start_stop_slideshow"  class="button icon stop" href="{$U_SLIDESHOW_STOP}" title="{'stop the slideshow'|@translate}">
    {'Stop'|@translate}
  </a>
    {/if}
    {if isset($slideshow.U_START_PLAY)}
  <a id="play_pause" class="button icon play" href="{$slideshow.U_START_PLAY}" title="{'Play of slideshow'|@translate}">
    Play
  </a>
    {/if}
    {if isset($slideshow.U_STOP_PLAY)}
  <a id="play_pause" class="button icon pause" href="{$slideshow.U_STOP_PLAY}" title="{'Pause of slideshow'|@translate}">
    Pause
  </a>
    {/if}
  <a id="increase_freq" class="button icon plus" {if isset($slideshow.U_DEC_PERIOD)}href="{$slideshow.U_DEC_PERIOD}" title="{'Accelerate diaporama speed'|@translate}"{/if}></a>
  <a id="decrease_freq" class="button icon minus" {if isset($slideshow.U_INC_PERIOD)}href="{$slideshow.U_INC_PERIOD}" title="{'Reduce diaporama speed'|@translate}"{/if}></a>
  {/if}
  <span id="first_button">
    <a id="first_pict" class="button icon first" {if isset($first)}href="{$first.U_IMG}" title="{'First'|@translate} : {$first.TITLE}" rel="start"{/if}></a>
  </span>
  <span id="go_to_prev">
    <a id="prev_pict" class="button icon prev" {if isset($previous)}href="{$previous.U_IMG}" title="{'Previous'|@translate} : {$previous.TITLE}" rel="prev"{/if}></a>
  </span>
  <span id="go_to_next">
    <a id="next_pict" class="button icon next" {if isset($next)}href="{$next.U_IMG}" title="{'Next'|@translate} : {$next.TITLE}" rel="next"{/if}></a>
  </span>
  <span id="last_button">
    <a id="last_pict" class="button icon last" {if isset($last)}href="{$last.U_IMG}" title="{'Last'|@translate} : {$last.TITLE}" rel="last"{/if}></a>
  </span>
</div>
{/if}
