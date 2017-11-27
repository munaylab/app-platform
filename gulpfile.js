const gulp = require('gulp');
const less = require('gulp-less');
const rename = require('gulp-rename');
const uglify = require('gulp-uglify');
const cleanCSS = require('gulp-clean-css');
const browserSync = require('browser-sync').create();

const jsFolder = 'grails-app/assets/javascripts/';
const cssFolder = 'grails-app/assets/stylesheets/css/';
const lessFolder = 'grails-app/assets/stylesheets/less/';
const fontsFolder = 'grails-app/assets/stylesheets/fonts/';
const jsFiles = [jsFolder + 'src/master-panel.js', jsFolder + 'src/landing.js'];
const cssFiles = [cssFolder + 'master-panel.css', cssFolder + 'landing.css'];
const lessFiles = [lessFolder + 'master-panel.less', lessFolder + 'landing.less'];

const resources = {
  javascripts: [
    'node_modules/vue/dist/*.min.js',
    'node_modules/jquery/dist/*.min.js',
    'node_modules/jquery.easing/*.min.js',
    'node_modules/raphael/raphael.min.js',
    'node_modules/morris.js/morris.min.js',
    'node_modules/bootstrap/dist/js/*.min.js',
    'node_modules/scrollreveal/dist/*.min.js',
    'node_modules/magnific-popup/dist/*.min.js',
    'node_modules/popper.js/dist/*.min.js',
    'node_modules/metismenu/dist/metisMenu.min.js'
  ],
  stylesheets: [
    'node_modules/morris.js/morris.css',
    'node_modules/magnific-popup/dist/*.css',
    'node_modules/font-awesome/css/*.min.css',
    'node_modules/bootstrap/dist/css/*.min.css',
    'node_modules/metismenu/dist/metisMenu.min.css'
  ],
  fonts: [
    'node_modules/font-awesome/fonts/*',
    'node_modules/bootstrap/dist/fonts/*'
  ]
};

gulp.task('install-js', function() {
  return gulp.src(resources.javascripts).pipe(gulp.dest(jsFolder));
});
gulp.task('install-css', function() {
  return gulp.src(resources.stylesheets).pipe(gulp.dest(cssFolder));
});
gulp.task('install-fonts', function() {
  return gulp.src(resources.fonts).pipe(gulp.dest(fontsFolder));
});
gulp.task('install', ['install-js', 'install-css', 'install-fonts']);

gulp.task('less', function() {
  return gulp.src(lessFiles).pipe(less()).pipe(gulp.dest(cssFolder))
      .pipe(browserSync.reload({
        stream: true
      }));
});
gulp.task('minify-css', ['less'], function() {
  return gulp.src(cssFiles).pipe(cleanCSS({ compatibility: 'ie8' }))
      .pipe(rename({ suffix: '.min' })).pipe(gulp.dest(cssFolder))
      .pipe(browserSync.reload({
        stream: true
      }));
});

gulp.task('js', function() {
  return gulp.src([jsFolder + 'src/master-panel.js']).pipe(gulp.dest(jsFolder))
      .pipe(browserSync.reload({
        stream: true
      }));
});
gulp.task('minify-js', ['js'], function() {
  return gulp.src(jsFiles).pipe(uglify()).pipe(rename({ suffix: '.min' }))
      .pipe(gulp.dest(jsFolder))
      .pipe(browserSync.reload({
          stream: true
      }));
});

gulp.task('minify', ['minify-js', 'minify-css']);

gulp.task('default', ['install', 'minify']);
