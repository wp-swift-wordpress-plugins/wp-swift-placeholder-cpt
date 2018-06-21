# WP Taoglas: Placeholders CPT

 * Plugin Name: WP Taoglas: Placeholders CPT
 * Plugin URI: 
 * Description: CPT & ACF for Placeholders. This can be disabled without loss of data but associated content will not be available.
 * Version: 1
 * Author: Gary Swift
 * Author URI: https://github.com/wp-swift-wordpress-plugins
 * License: GPL2

## Description
This plugin contains everything needed to handle the placeholder custom post type.

## Usage
This will explain how to display the content from this plugin.

#### Single
In the root of the active theme (or child theme), duplicate `single.php` and rename to `single-placeholder.php`. Now add the following code to wherever you want to output placeholder content.

```php
<?php
//@start plugin "WP Taoglas: Events CPT"
if (function_exists("wp_taoglas_placeholder_html")) echo wp_taoglas_placeholder_html();
//@end plugin "WP Taoglas: Events CPT"
```

#### Event Posts Pages
Go to the theme again and create a new template page page. I suggest that you duplicate `page.php` and rename it to `page-placeholders.php`. Add the following header to the template file.

```php
<?php
/*
Template Name: Events
*/
```

Now add the following code to wherever you want to output placeholder content.

```php
<?php
//@start plugin "WP Taoglas: Events CPT"
if (function_exists("wp_taoglas_placeholders_html")) echo wp_taoglas_placeholders_html();
//@end plugin "WP Taoglas: Events CPT"
```
## Licence
This project is licensed under the MIT license.

Copyright 2017 Gary Swift https://github.com/GarySwift

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

https://opensource.org/licenses/MIT