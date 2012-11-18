



if($.browser.mozilla||$.browser.opera){document.removeEventListener("DOMContentLoaded",$.ready,false);document.addEventListener("DOMContentLoaded",function(){$.ready()},false)}$.event.remove(window,"load",$.ready);$.event.add( window,"load",function(){$.ready()});$.extend({includeStates:{},include:function(url,callback,dependency){if(typeof callback!='function'&&!dependency){dependency=callback;callback=null}url=url.replace('\n','');$.includeStates[url]=false;var script=document.createElement('script');script.type='text/javascript';script.onload=function(){$.includeStates[url]=true;if(callback)callback.call(script)};script.onreadystatechange=function(){if(this.readyState!="complete"&&this.readyState!="loaded")return;$.includeStates[url]=true;if(callback)callback.call(script)};script.src=url;if(dependency){if(dependency.constructor!=Array)dependency=[dependency];setTimeout(function(){var valid=true;$.each(dependency,function(k,v){if(!v()){valid=false;return false}});if(valid)document.getElementsByTagName('head')[0].appendChild(script);else setTimeout(arguments.callee,10)},10)}else document.getElementsByTagName('head')[0].appendChild(script);return function(){return $.includeStates[url]}},readyOld:$.ready,ready:function(){if($.isReady) return;imReady=true;$.each($.includeStates,function(url,state){if(!state)return imReady=false});if(imReady){$.readyOld.apply($,arguments)}else{setTimeout(arguments.callee,10)}}});

/*$.include('jquery.color.js')*/
//$.include('jquery.backgroundPosition.js')
//$.include('jquery.easing.1.3.js')

$(function(){



$('.soc li a').hover
        (function(){
		 $(this).stop().animate({opacity:'0.3'},300); },
				  
		function(){
		 $(this).stop().animate({opacity:'1'},300);

		 })
	

$('.box-img').hover
        (function(){
		$(this).find('.box-hover').stop().animate({borderLeftWidth:'4px',borderRightWidth:'4px',borderTopWidth:'4px',borderBottomWidth:'4px',borderLeftColor:'#fff',borderRightColor:'#fff',borderTopColor:'#fff',borderBottomColor:'#fff'},150);
		
		 },  
		function(){
		$(this).find('.box-hover').stop().animate({borderLeftWidth:'1px',borderRightWidth:'1px',borderTopWidth:'1px',borderBottomWidth:'1px',borderLeftColor:'#e7e2df',borderRightColor:'#e7e2df',borderTopColor:'#e7e2df',borderBottomColor:'#e7e2df'},150);

		 })

$('.heading-wrapper').append('<span class="heading-after"></span>')

$('.heading-wrapper-center').append('<span class="heading-after"></span><span class="heading-before"></span>')




})			


$(window).load(function(){
 $('.heading-wrapper .heading-after').each(function() {
       var thiswidth = $(this).parent().width() - $(this).prev().width() - 10;
    $(this).css({width:thiswidth})
    });

 $('.heading-wrapper-center').each(function() {
       var thiswidthcenter = ($(this).width() - $(this).find('.heading').width())/2 - 40;
    $(this).find('.heading-after').css({width: thiswidthcenter})
    $(this).find('.heading-before').css({width: thiswidthcenter})
    });
})	
