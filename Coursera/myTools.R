# how to store output from the console?
# http://stackoverflow.com/questions/3503811/is-there-an-r-equivalent-to-the-bash-command-more
more <- function(x) {
        file <- tempfile()
        sink(file); on.exit(sink())
        print(x)
        file.show(file, delete.file = T)
}
# ## example of usage
# more(mtcars)
# more(more)
# -----------------------------------------------------------------------------

