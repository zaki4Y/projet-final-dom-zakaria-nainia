#? BLUE='\033[0;34m'
#! RED='\033[0;31m' 


#& for specify wher u need to creat ur folder
pwd 
echo -n "Enter the base directory where you want to create the folder structure: " 
read base_directory
if [ ! -d "$base_directory" ]; then
    echo "Base directory does not exist."
    echo "Creating it..."
    mkdir -p "$base_directory"
    echo -e "BASE DIRECTORY '$base_directory' IS CREATED"
fi
cd "$base_directory"


#& for creat name of folder
echo -n "Enter folder name: "
read namefolder
echo "YOUR FOLDER '$namefolder' IS CREATED."


#& for ask user if need sass
echo -e -n "do u need sass [y || n]" 
read sass
    while [ $sass != "y" ] && [ $sass != "n" ];
        do
            echo -e -n "\e[1;101m Something went wrong, so please type [y || n]: \e[0m "
            read sass
    done

#& for ask user if need bootstrap
echo -n "do u need link for BOOTSTRAP [y || n]: "
read bootstrap
    while [ $bootstrap != "y" ] && [ $bootstrap != "n" ];
        do
            echo -e -n "\e[1;101m Something went wrong, so please type [y || n]: \e[0m "
            read bootstrap
    done

#& to creat all file
#^file normal 
mkdir $namefolder
mkdir $namefolder/public
touch $namefolder/index.html
mkdir $namefolder/public/page
touch $namefolder/public/page/service.html
touch $namefolder/public/page/contact.html
touch $namefolder/public/page/sign_in.html
mkdir $namefolder/public/css
touch $namefolder/public/css/app.css
mkdir $namefolder/public/image
mkdir $namefolder/public/video
mkdir $namefolder/public/sound
mkdir $namefolder/public/fonts


#& to creat all file for sass
#^file with sass
# mkdir $namefolder/src
# mkdir $namefolder/src/sass
# touch $namefolder/src/sass/app.sass
# touch $namefolder/src/sass/_variables.sass
# touch $namefolder/src/sass/_allModules.sass
# touch $namefolder/src/sass/_fonts.sass
# mkdir $namefolder/src/sass/modules
# mkdir $namefolder/src/sass/modules/home
# touch $namefolder/src/sass/modules/home/_header.sass
# touch $namefolder/src/sass/modules/home/_main.sass
# touch $namefolder/src/sass/modules/home/_footer.sass
# mkdir $namefolder/src/sass/modules/about
# touch $namefolder/src/sass/modules/about/_header.sass
# touch $namefolder/src/sass/modules/about/_main.sass
# touch $namefolder/src/sass/modules/about/_footer.sass
# mkdir $namefolder/src/sass/modules/sign_in
# touch $namefolder/src/sass/modules/sign_in/_header.sass
# touch $namefolder/src/sass/modules/sign_in/_main.sass
# touch $namefolder/src/sass/modules/sign_in/_footer.sass


#&for link app.sass to all file
link_appsass="
    @import ./_variables
    @import ./_fonts
    @import ./_allModules
"
#& +link for bootstrap
link_appsass_bo="
    @import ./_variables
    @import ./_fonts
    @import ../../node_modules/bootstrap/scss/bootstrap.scss
    @import ../../node_modules/@fortawesome/fontawesome-free/css/all.css
    @import ./_allModules
"
#& for link allmodules
link_allmodule="
    @import ./modules/home/_header
    @import ./modules/home/_main
    @import ./modules/home/_footer

    @import ./modules/about/_header
    @import ./modules/about/_main
    @import ./modules/about/_footer

    @import ./modules/sign_in/_header
    @import ./modules/sign_in/_main
    @import ./modules/sign_in/_footer
"

# echo "$link_appsass" > "$namefolder/src/sass/app.sass"
# echo "$link_appsass_bo" > "$namefolder/src/sass/app.sass"
# echo "$link_allmodule" > "$namefolder/src/sass/_allModules.sass"




#& empty index
code_html1="
<!DOCTYPE html>
<html lang='en'>

<head>
    <meta charset='UTF-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Document</title>
    <link rel='stylesheet' href='./public/css/app.css'>
</head>

<body>

</body>

</html>
"
#&for print $code_html1 in all index
    echo "$code_html1" > "$namefolder/index.html"
    echo "$code_html1" > "$namefolder/public/page/service.html"
    echo "$code_html1" > "$namefolder/public/page/contact.html"
    echo "$code_html1" > "$namefolder/public/page/sign_in.html"


#& index with link js bootstrap
code_html2="
    <!DOCTYPE html>
    <html lang='en'>

    <head>
        <meta charset='UTF-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1.0'>
        <title>Document</title>
        <link rel='stylesheet' href='./public/css/app.css'>
    </head>

    <body>

        <script src="./node_modules/bootstrap/dist/js/bootstrap.bundle.js"></script>
    </body>

    </html>
"


#& for put what user need [scss || bootstrap || both || not]
if [ $sass == "y" ] && [ $bootstrap == "y" ]; then
    echo "open normal folder with sass and bootstrap..."
    echo "$code_html2" > "$namefolder/index.html"
    echo "$code_html2" > "$namefolder/public/page/service.html"
    echo "$code_html2" > "$namefolder/public/page/contact.html"
    echo "$code_html2" > "$namefolder/public/page/sign_in.html"
    mkdir $namefolder/src
    mkdir $namefolder/src/sass
    touch $namefolder/src/sass/app.sass
    touch $namefolder/src/sass/_variables.sass
    touch $namefolder/src/sass/_allModules.sass
    touch $namefolder/src/sass/_fonts.sass
    mkdir $namefolder/src/sass/modules
    mkdir $namefolder/src/sass/modules/home
    touch $namefolder/src/sass/modules/home/_header.sass
    touch $namefolder/src/sass/modules/home/_main.sass
    touch $namefolder/src/sass/modules/home/_footer.sass
    mkdir $namefolder/src/sass/modules/about
    touch $namefolder/src/sass/modules/about/_header.sass
    touch $namefolder/src/sass/modules/about/_main.sass
    touch $namefolder/src/sass/modules/about/_footer.sass
    mkdir $namefolder/src/sass/modules/sign_in
    touch $namefolder/src/sass/modules/sign_in/_header.sass
    touch $namefolder/src/sass/modules/sign_in/_main.sass
    touch $namefolder/src/sass/modules/sign_in/_footer.sass
    echo "$link_appsass_bo" > "$namefolder/src/sass/app.sass"
    echo "$link_allmodule" > "$namefolder/src/sass/_allModules.sass"
    cd $namefolder
    npm i bootstrap
    npm i --save @fortawesome/fontawesome-free

elif [ $sass == "y" ] && [ $bootstrap == "n" ]; then
    echo "open normal folder with sass..."
    mkdir $namefolder/src
    mkdir $namefolder/src/sass
    touch $namefolder/src/sass/app.sass
    touch $namefolder/src/sass/_variables.sass
    touch $namefolder/src/sass/_allModules.sass
    touch $namefolder/src/sass/_fonts.sass
    mkdir $namefolder/src/sass/modules
    mkdir $namefolder/src/sass/modules/home
    touch $namefolder/src/sass/modules/home/_header.sass
    touch $namefolder/src/sass/modules/home/_main.sass
    touch $namefolder/src/sass/modules/home/_footer.sass
    mkdir $namefolder/src/sass/modules/about
    touch $namefolder/src/sass/modules/about/_header.sass
    touch $namefolder/src/sass/modules/about/_main.sass
    touch $namefolder/src/sass/modules/about/_footer.sass
    mkdir $namefolder/src/sass/modules/sign_in
    touch $namefolder/src/sass/modules/sign_in/_header.sass
    touch $namefolder/src/sass/modules/sign_in/_main.sass
    touch $namefolder/src/sass/modules/sign_in/_footer.sass
    echo "$link_appsass" > "$namefolder/src/sass/app.sass"
    echo "$link_allmodule" > "$namefolder/src/sass/_allModules.sass"
    cd $namefolder

elif [ $sass == "n" ] && [ $bootstrap == "y" ]; then
    echo "Your request has not been accepted."
    echo "open normal folder..."

elif [ $sass == "n" ] && [ $bootstrap == "n" ]; then
    echo "open normal folder..."
fi

cd $namefolder
code .


