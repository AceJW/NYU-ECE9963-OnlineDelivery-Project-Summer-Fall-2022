(function(){var a=function(d,c){function f(){this.q=[];this.add=function(i){this.q.push(i)};var m,n;this.call=function(){for(m=0,n=this.q.length;m<n;m++){this.q[m].call()}}}function g(i,j){if(i.currentStyle){return i.currentStyle[j]}else{if(window.getComputedStyle){return window.getComputedStyle(i,null).getPropertyValue(j)}else{return i.style[j]}}}function b(m,t){if(!m.resizedAttached){m.resizedAttached=new f();m.resizedAttached.add(t)}else{if(m.resizedAttached){m.resizedAttached.add(t);return}}m.resizeSensor=document.createElement("div");m.resizeSensor.className="resize-sensor";var w="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;";var x="position: absolute; left: 0; top: 0; transition: 0s;";m.resizeSensor.style.cssText=w;m.resizeSensor.innerHTML='<div class="resize-sensor-expand" style="'+w+'"><div style="'+x+'"></div></div><div class="resize-sensor-shrink" style="'+w+'"><div style="'+x+' width: 200%; height: 200%"></div></div>';m.appendChild(m.resizeSensor);if(!{fixed:1,absolute:1}[g(m,"position")]){m.style.position="relative"}var n=m.resizeSensor.childNodes[0];var o=n.childNodes[0];var u=m.resizeSensor.childNodes[1];var v=u.childNodes[0];var q,p;var s=function(){o.style.width=n.offsetWidth+10+"px";o.style.height=n.offsetHeight+10+"px";n.scrollLeft=n.scrollWidth;n.scrollTop=n.scrollHeight;u.scrollLeft=u.scrollWidth;u.scrollTop=u.scrollHeight;q=m.offsetWidth;p=m.offsetHeight};s();var j=function(){if(m.resizedAttached){m.resizedAttached.call()}};var i=function(z,A,y){if(z.attachEvent){z.attachEvent("on"+A,y)}else{z.addEventListener(A,y)}};var r=function(){if(m.offsetWidth!=q||m.offsetHeight!=p){j()}s()};i(n,"scroll",r);i(u,"scroll",r)}var e=Object.prototype.toString.call(d);var k=("[object Array]"===e||("[object NodeList]"===e)||("[object HTMLCollection]"===e)||("undefined"!==typeof jQuery&&d instanceof jQuery)||("undefined"!==typeof Elements&&d instanceof Elements));if(k){var h=0,l=d.length;for(;h<l;h++){b(d[h],c)}}else{b(d,c)}this.detach=function(){if(k){var m=0,n=d.length;for(;m<n;m++){a.detach(d[m])}}else{a.detach(d)}}};a.detach=function(b){if(b.resizeSensor){b.removeChild(b.resizeSensor);delete b.resizeSensor;delete b.resizedAttached}};if(typeof module!=="undefined"&&typeof module.exports!=="undefined"){module.exports=a}else{window.ResizeSensor=a}})();