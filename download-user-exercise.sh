TEST_FILE_GLOB="*Test.[fc]s"
BACKUP_SUFFIX=".original"

cd $(exercism d -u $1)
sed -i .original 's/[(]Skip = "Remove to run test"[)]//' $TEST_FILE_GLOB
rm $TEST_FILE_GLOB$BACKUP_SUFFIX
dotnet test
code .