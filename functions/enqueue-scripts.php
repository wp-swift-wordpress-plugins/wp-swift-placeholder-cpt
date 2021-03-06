<?php
/**
 * Register the stylesheets for the public-facing side of the site.
 *
 * @since    1.0.0
 */
function wp_prefix_placeholder_enqueue_styles() {
	if (!ENQUEUE_PLACEHOLDER_CPT_STYLE) return;
	$file = 'assets/css/wp-text-domain-placeholder-public.css';
	if (file_exists( plugin_dir_path( __DIR__ ) . $file )) {
		$version = filemtime(plugin_dir_path( __DIR__ ) . $file);
		wp_enqueue_style( 
			"wp-text-domain-placeholder-public-css", 
			plugin_dir_url( __DIR__ ) . $file, array(), 
			$version, 
			'all' 
		);		
	}
}

/**
 * Register the script for the public-facing side of the site.
 *
 * @since    1.0.0
 */
function wp_prefix_placeholder_enqueue_script() {
	wp_prefix_placeholder_enqueue_dependencies();
	if (!ENQUEUE_PLACEHOLDER_CPT_SCRIPT) return;
	
	$file = 'assets/js/wp-text-domain-placeholder-public.js';
	if (file_exists( plugin_dir_path( __DIR__ ) . $file )) {
		$js_version = filemtime( plugin_dir_path( __DIR__ ) . $file );
		wp_enqueue_script( 
			"wp-text-domain-placeholder-public-js",
			plugin_dir_url( __DIR__ ) . $file,
			array( "jquery" ),
			$js_version,
			true
		);
	}
}

/**
 * Register the dependencies for this plugin.
 *
 * @since    1.0.0
 */
function wp_prefix_placeholder_enqueue_dependencies() {
	if (!ENQUEUE_PLACEHOLDER_CPT_DEPENDENCIES) return;
}

/**
 * Check if script and style should be added globally
 *
 * @since    1.0.0
 */
if (ENQUEUE_PLACEHOLDER_CPT_GLOBAL) {
	add_action( 'wp_enqueue_scripts', 'wp_prefix_placeholder_enqueue_styles');
	add_action( 'wp_enqueue_scripts', 'wp_prefix_placeholder_enqueue_script');
	add_action( 'wp_enqueue_scripts', 'wp_prefix_placeholder_enqueue_dependencies');	
}