#!/bin/bash -xe

die() {
  echo $@
  exit 1
}

rm -rf target/*
mvn compile test -X -e
grep -q 'TIMED_OUT' target/results/myFailingTest.status
grep -q 'SUCCESS' target/results/passingTest.status
grep -q 'ERROR 2' target/results/myReturnTest.status
grep -q 'passingTest arg1 arg2' target/results/passingTest.stderr
grep -q 'sleepTest' target/results/myFailingTest.stderr
[ -e target/results/mySkippedTest.status ] \
    && die "mySkippedTest.status should not exist"
[ -e target/results/myMissingTest.status ] \
    && die "myMissingTest.status should not exist"
echo "*** SUCCESS ***"
