const gulp = require('gulp');
const less = require('gulp-less');
const rename = require('gulp-rename');
const uglify = require('gulp-uglify');
const cleanCSS = require('gulp-clean-css');
const browserSync = require('browser-sync').create();

const dest = {
  jsFolder: 'grails-app/assets/javascripts/',
  cssFolder: 'grails-app/assets/stylesheets/css/',
  fontsFolder: 'grails-app/assets/stylesheets/fonts/'
};

const srcFolder = {
  jsFolder: 'src/assets/javascripts/',
  styleFolder: 'src/assets/stylesheets/'
}

const srcFiles = {
  jsFiles: [
    srcFolder.jsFolder + 'landing.js',
    srcFolder.jsFolder + 'master-panel.js'
  ],
  cssFiles: [
    srcFolder.styleFolder + 'org.css',
    srcFolder.styleFolder + 'landing.css',
    srcFolder.styleFolder + 'master-panel.css'
  ],
  lessFiles: [
    srcFolder.styleFolder + 'org.less',
    srcFolder.styleFolder + 'landing.less',
    srcFolder.styleFolder + 'master-panel.less'
  ]
}

const resources = {
  javascripts: [
    'node_modules/vue/dist/vue.min.js',
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
    'node_modules/bootstrap/dist/css/bootstrap.min.css',
    'node_modules/metismenu/dist/metisMenu.min.css'
  ],
  fonts: [
    'node_modules/font-awesome/fonts/*',
    'node_modules/bootstrap/dist/fonts/*'
  ]
};

gulp.task('install-js', function() {
  return gulp.src(resources.javascripts).pipe(gulp.dest(dest.jsFolder));
});
gulp.task('install-css', function() {
  return gulp.src(resources.stylesheets).pipe(gulp.dest(dest.cssFolder));
});
gulp.task('install-fonts', function() {
  return gulp.src(resources.fonts).pipe(gulp.dest(dest.fontsFolder));
});
gulp.task('install', ['install-js', 'install-css', 'install-fonts']);

gulp.task('less', function() {
  return gulp.src(srcFiles.lessFiles)
              .pipe(less())
              .pipe(gulp.dest(srcFolder.styleFolder));
});
gulp.task('minify-css', ['less'], function() {
  return gulp.src(srcFiles.cssFiles)
              .pipe(cleanCSS({ compatibility: 'ie8' }))
              .pipe(rename({ suffix: '.min' }))
              .pipe(gulp.dest(dest.cssFolder));
});

gulp.task('js', function() {
  return gulp.src(srcFiles.jsFiles)
              .pipe(gulp.dest(dest.jsFolder));
});
gulp.task('minify-js', ['js'], function() {
  return gulp.src(srcFiles.jsFiles)
              .pipe(uglify())
              .pipe(rename({ suffix: '.min' }))
              .pipe(gulp.dest(dest.jsFolder));
});

gulp.task('dev', ['default'], function() {
  gulp.watch(srcFolder.jsFolder + '*.js', ['js']);
  gulp.watch(srcFolder.styleFolder + '*.less', ['minify-css']);
});

gulp.task('minify', ['minify-js', 'minify-css']);

gulp.task('default', ['install', 'minify']);
