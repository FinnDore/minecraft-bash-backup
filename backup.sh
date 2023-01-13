FOLDER="./backups/$(date +%Y-%m-%d_%H_%M_%S)"
mkdir -p $FOLDER
cp -r $1 $FOLDER

rm -r "$FOLDER/minecraft/$2"
rm -r "$FOLDER/minecraft/cache"
rm -r "$FOLDER/minecraft/versions"
rm -r "$FOLDER/minecraft/libraries"

zip -r $FOLDER.zip $FOLDER
rm -rf $FOLDER

curl -X POST -F "payload_json={ \"content\": \"New backup\"}" -F "file1=@$FOLDER.zip" $DISCORD_URL
