var jsTheme =
{
	// init, something like a constructor
	init: function()
	{
		jsTheme.mobileNav.init();
		jsTheme.forms.init();
		jsTheme.catNav.init();
		jsTheme.selectNav.init();

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


jsTheme.catNav = 
{
	init:function()
	{
    	var url = window.location.pathname; //sets the variable "url" to the pathname of the current window
    	var activePage = url.substring(url.lastIndexOf('/') + 1); //sets the variable "activePage" as the substring after the last "/" in the "url" variable
        $('.immo-nav li a').each(function () { //looks in each link item within the primary-nav list
            var linkPage = this.href.substring(this.href.lastIndexOf('/') + 1); //sets the variable "linkPage" as the substring of the url path in each <a>
 
            if (activePage === linkPage) { //compares the path of the current window to the path of the linked page in the nav item
                $(this).parent().addClass('selected'); //if the above is true, add the "active" class to the parent of the <a> which is the <li> in the nav list
            }
        });

	}
};

jsTheme.selectNav = 
{
	init:function()
	{
    	var url = window.location.pathname; //sets the variable "url" to the pathname of the current window
    	var activePage = url.substring(url.lastIndexOf('/') + 1); //sets the variable "activePage" as the substring after the last "/" in the "url" variable
        $('#selector2 li a').each(function () { //looks in each link item within the primary-nav list
            var linkPage = this.href.substring(this.href.lastIndexOf('/') + 1); //sets the variable "linkPage" as the substring of the url path in each <a>
 
            if (activePage === linkPage) { //compares the path of the current window to the path of the linked page in the nav item
                $(this).parent().addClass('selected'); //if the above is true, add the "active" class to the parent of the <a> which is the <li> in the nav list
            }
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





