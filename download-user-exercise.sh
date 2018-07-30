TEST_FILE_GLOB="*Test.[fc]s"
BACKUP_SUFFIX=".original"

if [ -z $1 ]; then
    echo "Please call this script with the UUID of the user submission"
    exit 1
fi

cd $(exercism d -u $1)
find . -type file -name "\\\\*.[cf]s" -print0 | xargs -0  rename -f 's/\\//g'
sed -i .original 's/[(]Skip = "Remove to run test"[)]//' $TEST_FILE_GLOB
rm $TEST_FILE_GLOB$BACKUP_SUFFIX
dotnet test
code -r .