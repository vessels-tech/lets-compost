const gulp = require('gulp');
var replace = require('gulp-replace');

gulp.task('replace', function () {
    gulp.src('../site/config.template.yaml')

        .pipe(replace('__BASE_URL__', process.env.BASE_URL))
        .pipe(replace('__GOOGLE_ANALYTICS_TRACKING__', process.env.GOOGLE_ANALYTICS_TRACKING))
        .pipe(replace('__PROTOCOL__', process.env.PROTOCOL))
        .pipe(replace('__BASE_URL__', process.env.BASE_URL))
        .pipe(replace('__SITE_ID__', process.env.SITE_ID))
        .pipe(replace('__SITE_NAME__', process.env.SITE_NAME))

        .pipe(gulp.dest('/tmp/gulp'));
});
