#!/bin/sh -l
set -e
RESULT=$(eval "$1")
echo "::debug::\$RESULT: $RESULT"
echo "::add-mask::$RESULT"
# updating from 
# https://github.com/orgs/community/discussions/26288#discussioncomment-3876281
# https://docs.github.com/en/actions/using-workflows/workflow-commands-for-github-actions#setting-an-output-parameter
echo "::add-mask::$RESULT"
echo ::set-output name=result::"$RESULT"
delimiter=$(cat /proc/sys/kernel/random/uuid)
echo "result<<${delimiter}" >> "${GITHUB_OUTPUT}"
echo "${RESULT}" >> "${GITHUB_OUTPUT}"
echo "${delimiter}" >> "${GITHUB_OUTPUT}"

