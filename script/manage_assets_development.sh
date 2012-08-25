
# Should be the root rails directory
cd .. 
RAILS_ROOT=$(pwd)
cd script

echo ""
echo -e "######################################################"
echo "# About to clear public/assets and rebuild symlinks. #"
echo -e "######################################################\n"
echo -e "All inputs except [Y] will abort:\n\n"

rm -rf $RAILS_ROOT/public/assets
mkdir $RAILS_ROOT/public/assets
echo -e "+ Assets directory cleared\n$RAILS_ROOT/publis/assets\n"

# Images Symlink
ln -s $RAILS_ROOT/app/assets/images $RAILS_ROOT/public/assets/images
echo -e "+ Images symlink created:\n$RAILS_ROOT/public/assets/images\n"


# Javascript Symlink
ln -s $RAILS_ROOT/app/assets/javascripts $RAILS_ROOT/public/assets/js
echo -e "+ Javascript symlink created:\n$RAILS_ROOT/public/assets/js\n"

# Create CSS directory
mkdir $RAILS_ROOT/public/assets/css
echo -e "+ CSS directory created:\n$RAILS_ROOT/public/assets/css\n"

SCSS_DIRS="$RAILS_ROOT/app/assets/stylesheets:$RAILS_ROOT/public/assets/css"
SCSS_WATCH_OPTS="--watch -l"
SCSS_UPDATE_OPTS="--update -l -f"

echo -e "############################################################"
echo "# Would you like to run the SCSS compiler in 'watch' mode? #"
echo -e "############################################################\n"
echo -e "All inputs except [Y] will skip 'watch' mode and exit"

# Compile CSS with SCSS
scss --watch $SCSS_DIRS $SCSS_WATCH_OPTS 
