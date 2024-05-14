var Action = function() { }

Action.prototype = {
    
run: function(parameter) {
    parameter.completionFunction({"URL": document.URL, "title": document.title});
},
    
finalize: function(parameter) {
    var customJavaScript = parameters["customJavaScript"];
    eval(customJavaScript); 
}
    
};

var ExtensionPreprocessingJS = new Action
