// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

Event.addBehavior({ 

"form.prop_change select.prop_change-standard:change": function(ev) { 
      Hobo.ajaxRequest(window.location.href, ['standard-area-menu'], 
          { params: Form.serializeElements([this]), method: 'get', 
            spinnerNextTo: this, message: ""} ) 
      } 

}) 
