<?php
/**
 * Shortcodes
 *
 * If the CPT want to use shortcodes
 *
 * @author  		Gary Swift <gary@brightlight.ie>
 *
 * @since 			1.0
 */

// [placeholder foo="foo-value"]
function placeholder_func( $atts ) {
    return wp_prefix_placeholder_html( $atts );
}
// [placeholders foo="foo-value"]
function placeholders_func( $atts ) {
    return wp_prefix_placeholders_html( $atts );
}