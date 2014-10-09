var jsTheme =
{
	// init, something like a constructor
	init: function()
	{
		jsTheme.mobileNav.init();
		jsTheme.forms.init();
	//	console.log("javascript is locked and loaded!") // for testing purposes. Check your console. Delete after you finished reading this. :-)
	}

};

jsTheme.mobileNav =
{
	init: function()
	{
		jsTheme.mobileNav.enableMobileNav();
		jsTheme.mobileNav.buildMobileNav();
	},

	// CSS is based on the class .mobile-nav
	//
	enableMobileNav: function()
	{
		$("html").addClass("mobile-nav");
	},

	// build mobile nav
	buildMobileNav: function()
	{
		var navHolder = $('.header .inner');

		navHolder.prepend('<span class="main-nav-trigger">menu</span>');

		var trigger = $('.main-nav-trigger');
		var nav = $('.main-nav');

		trigger.on('click', function() {
			nav.toggle();
			$(this).toggleClass("trigger-active");
		});
	}

};

jsTheme.forms =
{
	init: function()
	{
		$('.alert-box').on('click', function(e)
		{
			e.preventDefault();
			$(this).closest('.alert-box').fadeOut(300);
		});
	}

};

$(jsTheme.init);



//
// JQuery
//


//
// retina display
//

// Set pixelRatio to 1 if the browser doesn't offer it up.
var pixelRatio = !!window.devicePixelRatio ? window.devicePixelRatio : 1;
 
// Rather than waiting for document ready, where the images
// have already loaded, we'll jump in as soon as possible.
$(window).on("load", function() {
    if (pixelRatio > 1) {
        $('.retina').each(function() {
 
            // Very naive replacement that assumes no dots in file names.
            $(this).attr('src', $(this).attr('src').replace(".","@2x."));
        });
    }

    $('.main-text .text').addClass('row');
    

});





