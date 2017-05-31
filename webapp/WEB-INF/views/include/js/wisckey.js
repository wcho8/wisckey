// Serialization, Deserialization
$.fn.serialization = function() {
	var rCRLF = /\r?\n/g;
	var rinput = /^(?:color|date|datetime|datetime-local|email|hidden|month|number|password|range|search|tel|text|time|url|week)$/i;
	var rselectTextarea = /^(?:select|textarea)/i;
	var objResult = {};
	var objData = this.find("*").map(function(){
		return this.elements ? jQuery.makeArray( this.elements ) : this;
	})
	.filter(function(){
		return this.id && !this.disabled &&
			( this.checked || rselectTextarea.test( this.nodeName ) ||
				rinput.test( this.type ) );
	})
	.map(function( i, elem ){
		var val = jQuery( this ).val();
		
		if (jQuery( this ).attr("currency") != undefined) {
			val = jQuery( this ).unmask();
		} 		

		return val == null ?
			null :
			jQuery.isArray( val ) ?
				jQuery.map( val, function( val, i ){
					return { id: elem.id, value: val.replace( rCRLF, "\r\n" ) };
				}) :
				{ id: elem.id, value: val.replace( rCRLF, "\r\n" ) };
	}).get();
	for (var i = 0; i < objData.length; i++) {
		objResult[objData[i].id] = objData[i].value;
	}
	
	return objResult;
};

$.fn.deserialization = function(objData) {
	var objThis = this;
	var inputList = ["INPUT", "SELECT", "TEXTAREA"];
	var excludeType = ["checkbox"];
	$.map(objData, function (value, key) {
		var objElem = objThis.find("#" + key);
		if (objElem.length > 0) {
			if ($.inArray(objElem.prop("tagName"), inputList) > -1) {
				if ($.inArray(objElem.attr("type"), excludeType) == -1) {
					objElem.val(value);
				}
			} else {
				objElem.text(value);
				objElem.html(objElem.html().replace(/\r\n|\r|\n/g, "<br />"));
			}
		}
	});
};
