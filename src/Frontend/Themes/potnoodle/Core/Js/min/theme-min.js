var jsTheme={init:function(){jsTheme.mobileNav.init(),jsTheme.forms.init(),jsTheme.catNav.init(),jsTheme.selectNav.init(),jsTheme.deleteImages.init(),jsTheme.changeDiv.init()}};jsTheme.mobileNav={init:function(){jsTheme.mobileNav.enableMobileNav(),jsTheme.mobileNav.buildMobileNav()},enableMobileNav:function(){$("html").addClass("mobile-nav")},buildMobileNav:function(){var e=$(".header .header-nav");e.prepend('<span class="main-nav-trigger">menu</span>');var i=$(".main-nav-trigger"),t=$(".main-nav");i.on("click",function(){t.toggle(),$(this).toggleClass("trigger-active")})}},jsTheme.forms={init:function(){$(".alert-box").on("click",function(e){e.preventDefault(),$(this).closest(".alert-box").fadeOut(300)})}},jsTheme.catNav={init:function(){var e=window.location.pathname,i=e.substring(e.lastIndexOf("/")+1);$(".immo-nav li a").each(function(){var e=this.href.substring(this.href.lastIndexOf("/")+1);i===e&&$(this).parent().addClass("selected")})}},jsTheme.selectNav={init:function(){var e=window.location.pathname,i=e.substring(e.lastIndexOf("/")+1);$("#selector2 li a").each(function(){var e=this.href.substring(this.href.lastIndexOf("/")+1);i===e&&$(this).parent().addClass("selected")})}},jsTheme.changeDiv={init:function(){}},$(jsTheme.init);var pixelRatio=window.devicePixelRatio?window.devicePixelRatio:1;$(window).on("load",function(){pixelRatio>1&&$(".retina").each(function(){$(this).attr("src",$(this).attr("src").replace(".","@2x."))}),$(".main-text .text").addClass("row"),$("#main-header-image3 img:not(:first)").remove()});