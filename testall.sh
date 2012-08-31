#!/bin/bash -xe

die() {
  echo $@
  exit 1
}

rm -rf target/*
mvn install -X -e -DskipTests

[ -f target/results/myFailingTest.status ] \
    && die "myFailingTest.status should not exist yet"
mvn test -Dtest=myFailingTest -X -e  # run just one test
grep -q 'TIMED_OUT' target/results/myFailingTest.status
[ -f target/results/passingTest.status ] \
    && die "passingTest.status should not exist yet"
mvn test -X -e # should run all tests 
grep -q 'ERROR 2' target/results/myReturnTest.status
rm -rf target/*
mvn compile test -X -e  # run al tests, again
grep -q 'SUCCESS' target/results/passingTest.status
grep -q 'ERROR 2' target/results/myReturnTest.status
grep -q 'passingTest arg1 arg2' target/results/passingTest.stderr
grep -q 'sleepTest' target/results/myFailingTest.stderr
[ -e target/results/mySkippedTest.status ] \
    && die "mySkippedTest.status should not exist"
[ -e target/results/myMissingTest.status ] \
    && die "myMissingTest.status should not exist"
echo "*** SUCCESS ***"
