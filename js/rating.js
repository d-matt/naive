var gRatingOptions, gRatingButtons, gUserRating;

function makeNiceRatingForm(options)
{
	gRatingOptions = options || {};
	var form = document.getElementById('rateForm');
	if (!form) return; //? template changed

	gRatingButtons = form.getElementsByTagName('input');
	gUserRating = "";
	for (var i=0; i<gRatingButtons.length; i++)
	{
		if ( gRatingButtons[i].type=="button" )
		{
			gUserRating = gRatingButtons[i].value;
			break;
		}
	}

	for (var i=0; i<gRatingButtons.length; i++)
	{
		var rateButton = gRatingButtons[i];
		rateButton.initialRateValue = rateButton.value; // save it as a property
		try { rateButton.type = "button"; } catch (e){}// avoid normal submit (use ajax); not working in IE6

		if (navigator.userAgent.indexOf('AppleWebKit/')==-1 && navigator.userAgent.indexOf('MSIE 8')==-1) rateButton.value = ""; //hide the text IE<8/Opera - breaks safari
		with (rateButton.style)
		{
			textIndent = "-50px"; //hide the text FF
			marginLeft = marginRight = 0;
		}

		if (i!=gRatingButtons.length-1 && rateButton.nextSibling.nodeType == 3 /*TEXT_NODE*/)
			rateButton.parentNode.removeChild(rateButton.nextSibling);
		if (i>0 && rateButton.previousSibling.nodeType == 3 /*TEXT_NODE*/)
			rateButton.parentNode.removeChild(rateButton.previousSibling);

		if(window.addEventListener){ // Mozilla, Netscape, Firefox
			rateButton.addEventListener("click", updateRating, false );
			rateButton.addEventListener("mouseout", resetRatingStarDisplay, false );
			rateButton.addEventListener("mouseover", updateRatingStarDisplayEvt, false );
		}
		else if(window.attachEvent) { // IE
			rateButton.attachEvent("onclick", updateRating);
			rateButton.attachEvent("onmouseout", resetRatingStarDisplay);
			rateButton.attachEvent("onmouseover", updateRatingStarDisplayEvt);
		}
	}
	resetRatingStarDisplay();
}

function resetRatingStarDisplay()
{
	updateRatingStarDisplay( gUserRating );
}

function updateRatingStarDisplay(userRating)
{
	for (var i=0; i<gRatingButtons.length; i++)
		gRatingButtons[i].className = (userRating!=="" && userRating>=gRatingButtons[i].initialRateValue ) ? "rateButtonStarFull" : "rateButtonStarEmpty";
}

function updateRatingStarDisplayEvt(e)
{
	updateRatingStarDisplay(
		e.target ? e.target.initialRateValue : e.srcElement.initialRateValue);
}

function updateRating(e)
{
	var rateButton = e.target || e.srcElement;
	if (rateButton.initialRateValue == gUserRating)
		return false; //nothing to do

	for (var i=0; i<gRatingButtons.length; i++) gRatingButtons[i].disabled=true;
	var y = new PwgWS(gRatingOptions.rootUrl);
	y.callService(
		"pwg.images.rate", {image_id: gRatingOptions.image_id, rate: rateButton.initialRateValue } ,
		{
			onFailure: function(num, text) {
				alert(num + " " + text);
				document.location = rateButton.form.action + "&rate="+rateButton.initialRateValue;
			},
			onSuccess: function(result) {
				gUserRating = rateButton.initialRateValue;
				for (var i=0; i<gRatingButtons.length; i++) gRatingButtons[i].disabled=false;
				if (gRatingOptions.updateRateElement) gRatingOptions.updateRateElement.innerHTML = gRatingOptions.updateRateText;
				if (gRatingOptions.ratingSummaryElement)
				{
					var t = gRatingOptions.ratingSummaryText;
					var args =[result.average, result.count, result.stdev], idx = 0, rexp = new RegExp( /%\.?\d*[sdf]/ );
					_xxx = t.match( rexp );
					while (idx<args.length) t=t.replace(rexp, args[idx++]);
					gRatingOptions.ratingSummaryElement.innerHTML = t;
				}
			}
		}
	);
	return false;
}