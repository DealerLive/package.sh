#! /bin/zsh

git clone git@github.com:DealerLive/DefaultPackage.git $1 #clones the defaultpackage
cd $1 # goes into the new directory

find . -name "*.json" -print0 -type f | xargs -0 sed -i '' -e "s/PackageName/$1/g" #finds/replaces DefaultPackage in composer.json
find . -name "*.php" -print0 -type f | xargs -0 sed -i '' -e "s/PackageName/$1/g" #finds/replaces DefaultPackage in PHP classes
mv src/DealerLive/PackageName src/DealerLive/$1 #renames the main folder
mv src/DealerLive/$1/PackageNameServiceProvider.php src/DealerLive/$1/$1ServiceProvider.php #renames the service provider