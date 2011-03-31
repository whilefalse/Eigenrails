// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
Event.observe(window, 'load', function() {
    $$('.matrix-value').invoke('observe', 'focus', function(){
        $(this).addClassName('hover');
        if (this.value == '0'){this.value = '';}
    }).invoke('observe', 'blur', function(){
        $(this).removeClassName('hover');
        if (this.value == ''){this.value = '0';}
    });
});
