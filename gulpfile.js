var concat = require('gulp-concat');
var gulp = require('gulp');
var minifyCSS = require('gulp-minify-css');

gulp.task('scripts', function() {
  gulp.src([
	'./public/jquery/dist/jquery.min.js',
	'./public/bootstrap/dist/js/bootstrap.min.js'
   ])
    .pipe(concat('scripts.js'))
    .pipe(gulp.dest('./public'));
});

gulp.task('styles', function() {
  gulp.src(['./public/bootstrap/dist/css/bootstrap.min.css',
   './public/Blog.css'])
    .pipe(concat('styles.css'))
    .pipe(minifyCSS())
    .pipe(gulp.dest('./public'));
});


