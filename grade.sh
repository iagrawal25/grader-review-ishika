rm -f ListExamples.java

CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

set -e
files=`find ./*/*`

for file in $files
do 
    if [[ -f ./student-submission/ListExamples.java ]]
    then
        continue
    else
        exit
    fi 
done

mv -v ./student-submission/ListExamples.java ./

javac -cp ".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar" *.java
if [[ $? == 0 ]]
then
    echo 'Successfully compiled!'
else
    echo 'Compilation error.'
fi

java -cp ".:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar" org.junit.runner.JUnitCore TestListExamples > TestResults.txt
