var jsTheme={init:function(){jsTheme.forms.init(),jsTheme.catNav.init(),jsTheme.selectNav.init()}};jsTheme.forms={init:function(){$(".alert-box").on("click",function(e){e.preventDefault(),$(this).closest(".alert-box").fadeOut(300)})}},jsTheme.catNav={init:function(){var e=window.location.pathname,i=e.substring(e.lastIndexOf("/")+1);$(".immo-nav li a").each(function(){var e=this.href.substring(this.href.lastIndexOf("/")+1);i===e&&$(this).parent().addClass("selected")})}},jsTheme.selectNav={init:function(){var e=window.location.pathname,i=e.substring(e.lastIndexOf("/")+1);$("#selector2 li a").each(function(){var e=this.href.substring(this.href.lastIndexOf("/")+1);i===e&&$(this).parent().addClass("selected")})}},$(jsTheme.init);var pixelRatio=window.devicePixelRatio?window.devicePixelRatio:1;$(window).on("load",function(){pixelRatio>1&&$(".retina").each(function(){$(this).attr("src",$(this).attr("src").replace(".","@2x."))}),$(".main-text .text").addClass("row"),$("#main-header-image3 img:not(:first)").remove(),$(".main-nav").hide(),$(".main-nav-trigger").on("click",function(){$(".main-nav").toggle()})}),$(document).ready(function(){$(".main").onepage_scroll({sectionContainer:"section",responsiveFallback:600,loop:!0})});