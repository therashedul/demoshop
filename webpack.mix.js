const mix = require("laravel-mix");

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js(
    ["resources/js/alertjs1.js", "resources/js/alertjs2.js"],
    "public/js/common.js"
)
    .postCss("resources/css/example1.css", "public/css/common.css")
    .postCss("resources/css/example2.css", "public/css/common.css")

    .sass("resources/sass/app.scss", "public/css")
    .sourceMaps();

// another way install css file
// mix.styles(
//     ["resources/css/example1.css", "resources/css/example2.css"],
//     "public/css/common.css"
// );
