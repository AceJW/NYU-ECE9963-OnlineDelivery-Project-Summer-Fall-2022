(function(){var a=function(d,c){function f(){this.q=[];this.add=function(i){this.q.push(i)};var m,n;this.call=function(){for(m=0,n=this.q.length;m<n;m++){this.q[m].call()}}}function g(i,j){if(i.currentStyle){return i.currentStyle[j]}else{if(window.getComputedStyle){return window.getComputedStyle(i,null).getPropertyValue(j)}else{return i.style[j]}}}function b(m,t){if(!m.resizedAttached){m.resizedAttached=new f();m.resizedAttached.add(t)}else{if(m.resizedAttached){m.resizedAttached.add(t);return}}m.resizeSensor=document.createElement("div");m.resizeSensor.className="resize-sensor";var w="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;";var x="position: absolute; left: 0; top: 0; transition: 0s;";m.resizeSensor.style.cssText=w;m.resizeSensor.innerHTML='<div class="resize-sensor-expand" style="'+w+'"><div style="'+x+'"></div></div><div class="resize-sensor-shrink" style="'+w+'"><div style="'+x+' width: 200%; height: 200%"></div></div>';m.appendChild(m.resizeSensor);if(!{fixed:1,absolute:1}[g(m,"position")]){m.style.position="relative"}var n=m.resizeSensor.childNodes[0];var o=n.childNodes[0];var u=m.resizeSensor.childNodes[1];var v=u.childNodes[0];var q,p;var s=function(){o.style.width=n.offsetWidth+10+"px";o.style.height=n.offsetHeight+10+"px";n.scrollLeft=n.scrollWidth;n.scrollTop=n.scrollHeight;u.scrollLeft=u.scrollWidth;u.scrollTop=u.scrollHeight;q=m.offsetWidth;p=m.offsetHeight};s();var j=function(){if(m.resizedAttached){m.resizedAttached.call()}};var i=function(z,A,y){if(z.attachEvent){z.attachEvent("on"+A,y)}else{z.addEventListener(A,y)}};var r=function(){if(m.offsetWidth!=q||m.offsetHeight!=p){j()}s()};i(n,"scroll",r);i(u,"scroll",r)}var e=Object.prototype.toString.call(d);var k=("[object Array]"===e||("[object NodeList]"===e)||("[object HTMLCollection]"===e)||("undefined"!==typeof jQuery&&d instanceof jQuery)||("undefined"!==typeof Elements&&d instanceof Elements));if(k){var h=0,l=d.length;for(;h<l;h++){b(d[h],c)}}else{b(d,c)}this.detach=function(){if(k){var m=0,n=d.length;for(;m<n;m++){a.detach(d[m])}}else{a.detach(d)}}};a.detach=function(b){if(b.resizeSensor){b.removeChild(b.resizeSensor);delete b.resizeSensor;delete b.resizedAttached}};if(typeof module!=="undefined"&&typeof module.exports!=="undefined"){module.exports=a}else{window.ResizeSensor=a}})();
/*
 * Theia Sticky Sidebar v1.7.0
 * https://github.com/WeCodePixels/theia-sticky-sidebar
 *
 * Glues your website's sidebars, making them permanently visible while scrolling.
 *
 * Copyright 2013-2016 WeCodePixels and other contributors
 * Released under the MIT license
 */
(function(a){a.fn.theiaStickySidebar=function(e){var b={containerSelector:"",additionalMarginTop:0,additionalMarginBottom:0,updateSidebarHeight:true,minWidth:0,disableOnResponsiveLayouts:true,sidebarBehavior:"modern",defaultPosition:"relative",namespace:"TSS"};e=a.extend(b,e);e.additionalMarginTop=parseInt(e.additionalMarginTop)||0;e.additionalMarginBottom=parseInt(e.additionalMarginBottom)||0;g(e,this);function g(i,h){var j=f(i,h);if(!j){console.log("TSS: Body width smaller than options.minWidth. Init is delayed.");a(document).on("scroll."+i.namespace,function(l,k){return function(m){var n=f(l,k);if(n){a(this).unbind(m)}}}(i,h));a(window).on("resize."+i.namespace,function(l,k){return function(m){var n=f(l,k);if(n){a(this).unbind(m)}}}(i,h))}}function f(i,h){if(i.initialized===true){return true}if(a("body").width()<i.minWidth){return false}d(i,h);return true}function d(j,h){j.initialized=true;var i=a("#theia-sticky-sidebar-stylesheet-"+j.namespace);if(i.length===0){a("head").append(a('<style id="theia-sticky-sidebar-stylesheet-'+j.namespace+'">.theiaStickySidebar:after {content: ""; display: table; clear: both;}</style>'))}h.each(function(){var p={};p.sidebar=a(this);p.options=j||{};p.container=a(p.options.containerSelector);if(p.container.length==0){p.container=p.sidebar.parent()}p.sidebar.parents(":not(.theia-exception)").css("-webkit-transform","none");p.sidebar.css({position:p.options.defaultPosition,overflow:"visible","-webkit-box-sizing":"border-box","-moz-box-sizing":"border-box","box-sizing":"border-box"});p.stickySidebar=p.sidebar.find(".theiaStickySidebar");if(p.stickySidebar.length==0){var n=/(?:text|application)\/(?:x-)?(?:javascript|ecmascript)/i;p.sidebar.find("script").filter(function(o,r){return r.type.length===0||r.type.match(n)}).remove();p.stickySidebar=a("<div>").addClass("theiaStickySidebar").append(p.sidebar.children());p.sidebar.append(p.stickySidebar)}p.marginBottom=parseInt(p.sidebar.css("margin-bottom"));p.paddingTop=parseInt(p.sidebar.css("padding-top"));p.paddingBottom=parseInt(p.sidebar.css("padding-bottom"));var l=p.stickySidebar.offset().top;var k=p.stickySidebar.outerHeight();p.stickySidebar.css("padding-top",1);p.stickySidebar.css("padding-bottom",1);l-=p.stickySidebar.offset().top;k=p.stickySidebar.outerHeight()-k-l;if(l==0){p.stickySidebar.css("padding-top",0);p.stickySidebarPaddingTop=0}else{p.stickySidebarPaddingTop=1}if(k==0){p.stickySidebar.css("padding-bottom",0);p.stickySidebarPaddingBottom=0}else{p.stickySidebarPaddingBottom=1}p.previousScrollTop=null;p.fixedScrollTop=0;q();p.onScroll=function(u){if(!u.stickySidebar.is(":visible")){return}if(a("body").width()<u.options.minWidth){q();return}if(u.options.disableOnResponsiveLayouts){var D=u.sidebar.outerWidth(u.sidebar.css("float")=="none");if(D+50>u.container.width()){q();return}}var z=a(document).scrollTop();var x="static";if(z>=u.sidebar.offset().top+(u.paddingTop-u.options.additionalMarginTop)){var w=u.paddingTop+j.additionalMarginTop;var v=u.paddingBottom+u.marginBottom+j.additionalMarginBottom;var s=u.sidebar.offset().top;var r=u.sidebar.offset().top+m(u.container);var I=0+j.additionalMarginTop;var H;var C=(u.stickySidebar.outerHeight()+w+v)<a(window).height();if(C){H=I+u.stickySidebar.outerHeight()}else{H=a(window).height()-u.marginBottom-u.paddingBottom-j.additionalMarginBottom}var F=s-z+u.paddingTop;var E=r-z-u.paddingBottom-u.marginBottom;var G=u.stickySidebar.offset().top-z;var A=u.previousScrollTop-z;if(u.stickySidebar.css("position")=="fixed"){if(u.options.sidebarBehavior=="modern"){G+=A}}if(u.options.sidebarBehavior=="stick-to-top"){G=j.additionalMarginTop}if(u.options.sidebarBehavior=="stick-to-bottom"){G=H-u.stickySidebar.outerHeight()}if(A>0){G=Math.min(G,I)}else{G=Math.max(G,H-u.stickySidebar.outerHeight())}G=Math.max(G,F);G=Math.min(G,E-u.stickySidebar.outerHeight());var B=u.container.height()==u.stickySidebar.outerHeight();if(!B&&G==I){x="fixed"}else{if(!B&&G==H-u.stickySidebar.outerHeight()){x="fixed"}else{if(z+G-u.sidebar.offset().top-u.paddingTop<=j.additionalMarginTop){x="static"}else{x="absolute"}}}}if(x=="fixed"){var y=a(document).scrollLeft();u.stickySidebar.css({position:"fixed",width:c(u.stickySidebar)+"px",transform:"translateY("+G+"px)",left:(u.sidebar.offset().left+parseInt(u.sidebar.css("padding-left"))-y)+"px",top:"0px"})}else{if(x=="absolute"){var t={};if(u.stickySidebar.css("position")!="absolute"){t.position="absolute";t.transform="translateY("+(z+G-u.sidebar.offset().top-u.stickySidebarPaddingTop-u.stickySidebarPaddingBottom)+"px)";t.top="0px"}t.width=c(u.stickySidebar)+"px";t.left="";u.stickySidebar.css(t)}else{if(x=="static"){q()}}}if(x!="static"){if(u.options.updateSidebarHeight==true){u.sidebar.css({"min-height":u.stickySidebar.outerHeight()+u.stickySidebar.offset().top-u.sidebar.offset().top+u.paddingBottom})}}u.previousScrollTop=z};p.onScroll(p);a(document).on("scroll."+p.options.namespace,function(r){return function(){r.onScroll(r)}}(p));a(window).on("resize."+p.options.namespace,function(r){return function(){r.stickySidebar.css({position:"static"});r.onScroll(r)}}(p));if(typeof ResizeSensor!=="undefined"){new ResizeSensor(p.stickySidebar[0],function(r){return function(){r.onScroll(r)}}(p))}function q(){p.fixedScrollTop=0;p.sidebar.css({"min-height":"1px"});p.stickySidebar.css({position:"static",width:"",transform:"none"})}function m(o){var r=o.height();o.children().each(function(){r=Math.max(r,a(this).height())});return r}})}function c(i){var j;try{j=i[0].getBoundingClientRect().width}catch(h){}if(typeof j==="undefined"){j=i.width()}return j}return this}})(jQuery);