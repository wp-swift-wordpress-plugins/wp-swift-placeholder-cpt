<?php
function wp_prefix_placeholder_html( $atts = array() ) {
	return wp_prefix_placeholders_get_template_part( 'html/the-content-single.php', true );
}
function wp_prefix_placeholders_html( $atts = array() ) {
	return wp_prefix_placeholders_get_template_part( 'html/placeholder-loop.php' );
}
function wp_prefix_placeholders_get_template_part( $template, $single = false, $global = false ) {
	wp_prefix_placeholder_enqueue_styles();
	wp_prefix_placeholder_enqueue_script();
	ob_start();
	include plugin_dir_path( __DIR__ ) . $template;
	$html = ob_get_contents();
	ob_end_clean();
	return $html;
}