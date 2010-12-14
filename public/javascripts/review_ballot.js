jQuery(document).ready(function() {
    // Makes stars glow on hover.
    jQuery('form.rating_ballot > p > label').hover(
        function() {    // mouseover
            jQuery(this).prevAll().andSelf().addClass('glow');
        },function() {  // mouseout
            jQuery(this).siblings().andSelf().removeClass('glow');
    });

    // Makes stars stay glowing after click.
    jQuery('form.rating_ballot > p > label').click(function() {
        jQuery(this).siblings().removeClass("bright");
	jQuery(this).prevAll().andSelf().addClass("bright");
    });
    jQuery('form.rating_ballot').submit(function() { 
	jQuery('form.rating_ballot > p > textarea').val('');
	jQuery('form.rating_ballot > p > label').prevAll().andSelf().removeClass("bright");
    });
});