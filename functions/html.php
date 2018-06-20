<?php
function wp_taoglas_placeholder_html() {
	return wp_taoglas_placeholders_get_template_part( 'html/the-content-single.php', true );
}
function wp_taoglas_placeholders_html() {
	return wp_taoglas_placeholders_get_template_part( 'html/placeholder-loop.php' );
}
function wp_taoglas_placeholders_get_template_part( $template, $single = false, $global = false ) {
	wp_taoglas_placeholder_enqueue_styles();
	wp_taoglas_placeholder_enqueue_script();
	ob_start();
	include plugin_dir_path( __DIR__ ) . $template;
	$html = ob_get_contents();
	ob_end_clean();
	return $html;
}