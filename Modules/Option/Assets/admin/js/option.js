!function(t){var e={};function o(n){if(e[n])return e[n].exports;var r=e[n]={i:n,l:!1,exports:{}};return t[n].call(r.exports,r,r.exports,o),r.l=!0,r.exports}o.m=t,o.c=e,o.d=function(t,e,n){o.o(t,e)||Object.defineProperty(t,e,{configurable:!1,enumerable:!0,get:n})},o.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return o.d(e,"a",e),e},o.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},o.p="/",o(o.s=257)}({257:function(t,e,o){t.exports=o(258)},258:function(t,e,o){"use strict";Object.defineProperty(e,"__esModule",{value:!0});var n=function(){return function(t,e){if(Array.isArray(t))return t;if(Symbol.iterator in Object(t))return function(t,e){var o=[],n=!0,r=!1,i=void 0;try{for(var a,l=t[Symbol.iterator]();!(n=(a=l.next()).done)&&(o.push(a.value),!e||o.length!==e);n=!0);}catch(t){r=!0,i=t}finally{try{!n&&l.return&&l.return()}finally{if(r)throw i}}return o}(t,e);throw new TypeError("Invalid attempt to destructure non-iterable instance")}}(),r=function(){function t(t,e){for(var o=0;o<e.length;o++){var n=e[o];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(t,n.key,n)}}return function(e,o,n){return o&&t(e.prototype,o),n&&t(e,n),e}}();var i=function(){function t(){!function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,t)}return r(t,[{key:"addOptionsErrors",value:function(t){for(var e in t){var o=this.getInputFieldForErrorKey(e);o.closest(".option").addClass("option-has-errors");var n=o.parent();n.addClass("has-error"),n.append('<span class="help-block">'+t[e][0]+"</span>")}}},{key:"getRowTemplate",value:function(t){var e=_.template($("#option-select-values-template").html());return $(e(t))}},{key:"changeOptionType",value:function(t){var e=t.optionId,o=t.values,n=void 0===o?[]:o,r=this.getOptionValuesElement(e),i={optionId:e,value:{id:"",label:"",price:"",price_type:"fixed"}},a=_.template($("#option-select-template").html());r.html(a(i)),this.addOptionRowEventListener(e),this.addOptionRows({optionId:e,values:n}),0===n.length&&this.getAddNewRowButton(e).trigger("click")}},{key:"addOptionRows",value:function(t){var e=t.optionId,o=t.values,r=!0,i=!1,a=void 0;try{for(var l,u=o.entries()[Symbol.iterator]();!(r=(l=u.next()).done);r=!0){var p=l.value,c=n(p,2),s=c[0],d=c[1];this.addOptionRow({optionId:e,valueId:s,value:d})}}catch(t){i=!0,a=t}finally{try{!r&&u.return&&u.return()}finally{if(i)throw a}}}},{key:"initOptionRow",value:function(t,e){0===e.length||e.is(".sortable")||(this.makeSortable(e[0]),e.addClass("sortable")),this.deleteOptionRowEventListener(t),window.admin.tooltip()}},{key:"deleteOptionRowEventListener",value:function(t){t.find(".delete-row").on("click",function(t){$(t.currentTarget).closest(".option-row").remove()})}},{key:"makeSortable",value:function(t){Sortable.create(t,{handle:".drag-icon",animation:150})}}]),t}(),a=function(){function t(t,e){for(var o=0;o<e.length;o++){var n=e[o];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(t,n.key,n)}}return function(e,o,n){return o&&t(e.prototype,o),n&&t(e,n),e}}(),l=function t(e,o,n){null===e&&(e=Function.prototype);var r=Object.getOwnPropertyDescriptor(e,o);if(void 0===r){var i=Object.getPrototypeOf(e);return null===i?void 0:t(i,o,n)}if("value"in r)return r.value;var a=r.get;return void 0!==a?a.call(n):void 0};var u=function(t){function e(){!function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,e);var t=function(t,e){if(!t)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return!e||"object"!=typeof e&&"function"!=typeof e?t:e}(this,(e.__proto__||Object.getPrototypeOf(e)).call(this));return $("#type").on("change",function(){l(e.prototype.__proto__||Object.getPrototypeOf(e.prototype),"changeOptionType",t).call(t,{values:FleetCart.data["option.values"]}),l(e.prototype.__proto__||Object.getPrototypeOf(e.prototype),"addOptionsErrors",t).call(t,FleetCart.errors["option.values"])}),$("#type").trigger("change"),window.admin.removeSubmitButtonOffsetOn("#values"),t}return function(t,e){if("function"!=typeof e&&null!==e)throw new TypeError("Super expression must either be null or a function, not "+typeof e);t.prototype=Object.create(e&&e.prototype,{constructor:{value:t,enumerable:!1,writable:!0,configurable:!0}}),e&&(Object.setPrototypeOf?Object.setPrototypeOf(t,e):t.__proto__=e)}(e,i),a(e,[{key:"addOptionRow",value:function(t){var o=t.valueId,n=t.value,r=void 0===n?{label:"",price:"",price_type:"fixed"}:n,i=this.getRowTemplate({optionId:void 0,valueId:o,value:r}),a=$("#select-values").append(i);l(e.prototype.__proto__||Object.getPrototypeOf(e.prototype),"initOptionRow",this).call(this,i,a)}},{key:"addOptionRowEventListener",value:function(){var t=this;$("#add-new-row").on("click",function(){var e=$("#option-values .option-row").length;t.addOptionRow({valueId:e})})}},{key:"getOptionValuesElement",value:function(){return $("#option-values")}},{key:"getAddNewRowButton",value:function(){return $("#add-new-row")}},{key:"getInputFieldForErrorKey",value:function(t){var e=t.split(".");return e=e.map(function(t){return t.split("_").join("-")}),$("#"+e.join("-"))}}]),e}(),p=function(){function t(t,e){for(var o=0;o<e.length;o++){var n=e[o];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(t,n.key,n)}}return function(e,o,n){return o&&t(e.prototype,o),n&&t(e,n),e}}(),c=function t(e,o,n){null===e&&(e=Function.prototype);var r=Object.getOwnPropertyDescriptor(e,o);if(void 0===r){var i=Object.getPrototypeOf(e);return null===i?void 0:t(i,o,n)}if("value"in r)return r.value;var a=r.get;return void 0!==a?a.call(n):void 0};var s=function(t){function e(){!function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,e);var t=function(t,e){if(!t)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return!e||"object"!=typeof e&&"function"!=typeof e?t:e}(this,(e.__proto__||Object.getPrototypeOf(e)).call(this));return t.optionsCount=0,t.addOptions(FleetCart.data["product.options"]),0===t.optionsCount&&t.addOption(),t.optionsCount>3&&t.collapseOptions(),c(e.prototype.__proto__||Object.getPrototypeOf(e.prototype),"addOptionsErrors",t).call(t,FleetCart.errors["product.options"]),$("#add-new-option").on("click",function(){return t.addOption()}),$("#add-global-option").on("click",function(){return t.addGlobalOption()}),t}return function(t,e){if("function"!=typeof e&&null!==e)throw new TypeError("Super expression must either be null or a function, not "+typeof e);t.prototype=Object.create(e&&e.prototype,{constructor:{value:t,enumerable:!1,writable:!0,configurable:!0}}),e&&(Object.setPrototypeOf?Object.setPrototypeOf(t,e):t.__proto__=e)}(e,i),p(e,[{key:"addOptions",value:function(t){var e=!0,o=!1,n=void 0;try{for(var r,i=t[Symbol.iterator]();!(e=(r=i.next()).done);e=!0){var a=r.value;this.addOption(a)}}catch(t){o=!0,n=t}finally{try{!e&&i.return&&i.return()}finally{if(o)throw n}}}},{key:"collapseOptions",value:function(){var t=$(".option:not(.option-has-errors)"),e=!0,o=!1,n=void 0;try{for(var r,i=t[Symbol.iterator]();!(e=(r=i.next()).done);e=!0){var a=r.value;$(a).find("[data-toggle=collapse]").trigger("click")}}catch(t){o=!0,n=t}finally{try{!e&&i.return&&i.return()}finally{if(o)throw n}}}},{key:"addGlobalOption",value:function(){var t=this,e=$("#global-option").val();if(""===e)return window.admin.stopButtonLoading($("#add-global-option"));$.ajax({type:"GET",url:route("admin.options.show",e),dataType:"json",success:function(e){t.addOption(e),window.admin.stopButtonLoading($("#add-global-option"))}})}},{key:"addOption",value:function(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{id:null,name:null,type:null,is_required:!1,values:[]};t.is_required=!!JSON.parse(t.is_required);var o=this.optionsCount,n=_.template($("#option-template").html()),r=$(n({option:t,optionId:o}));null!==t.name&&setTimeout(function(){$("#option-"+o).find("#option-name").text(t.name)});var i=$("#options-group").append(r);i.is(".sortable")||(c(e.prototype.__proto__||Object.getPrototypeOf(e.prototype),"makeSortable",this).call(this,i[0]),i.addClass("sortable")),this.deleteOptionEventListener(r),this.updateOptionNameEventListener(o),this.updateTemplateEventListener(o,t.values),window.admin.tooltip(),this.optionsCount++}},{key:"deleteOptionEventListener",value:function(t){t.find(".delete-option").on("click",function(t){return $(t.currentTarget).closest(".option").remove()})}},{key:"updateOptionNameEventListener",value:function(t){var e=$("#option-"+t),o=e.find("#option-name").text();$(e).find(".option-name-field").on("input",function(t){var n=""!==t.currentTarget.value?t.currentTarget.value:o;e.find("#option-name").text(n)})}},{key:"updateTemplateEventListener",value:function(t){var o=this,n=arguments.length>1&&void 0!==arguments[1]?arguments[1]:[],r=$("#option-"+t+"-type");r.on("change",function(r){if(""===r.currentTarget.value)return o.getOptionValuesElement(t).html("");c(e.prototype.__proto__||Object.getPrototypeOf(e.prototype),"changeOptionType",o).call(o,{optionId:t,values:n})}),r.trigger("change")}},{key:"addOptionRow",value:function(t){var o=t.optionId,n=t.valueId,r=t.value,i=void 0===r?{label:"",price:"",price_type:"fixed"}:r,a=this.getRowTemplate({optionId:o,valueId:n,value:i}),l=$("#option-"+o+"-select-values").append(a);c(e.prototype.__proto__||Object.getPrototypeOf(e.prototype),"initOptionRow",this).call(this,a,l)}},{key:"addOptionRowEventListener",value:function(t){var e=this;$("#option-"+t+"-add-new-row").on("click",function(){var o=$("#option-"+t+"-values .option-row").length;e.addOptionRow({optionId:t,valueId:o})})}},{key:"getOptionValuesElement",value:function(t){return $("#option-"+t+"-values")}},{key:"getAddNewRowButton",value:function(t){return $("#option-"+t+"-add-new-row")}},{key:"getInputFieldForErrorKey",value:function(t){var e=t.split(".");return e.shift(),e=e.map(function(t){return t.split("_").join("-")}),$("#option-"+e.join("-"))}}]),e}();0!==$("#option-create-form, #option-edit-form").length&&new u,0!==$("#product-create-form, #product-edit-form").length&&new s}});