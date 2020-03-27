#!/bin/sh
#
#    Copyright 2010-2020 the original author or authors.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#

mv deployment/*.war .
mv deployment/*.ear .

war=$(ls *.war 2> /dev/null | wc -l)
ear=$(ls *.ear 2> /dev/null | wc -l)
lib=$(ls deployment/lib/*  2> /dev/null | wc -l)
conf=$(ls deployment/config/* 2> /dev/null | wc -l)

if [ $lib -gt 0  ]
then
  for x in deployment/lib/*.*
  do
    mv $x /lib/
  done
fi

if [ $conf -gt 0  ]
then
  for y in deployment/config/*.*
  do
    mv $y /config/
  done
fi

if [ $war -gt 0 ]
then
  for i in *.war
  do
    #mv $i /deploy/
    fname=${i%.war}
    mkdir /deploy/$fname
    unzip -d /deploy/$fname $i
  done
fi

if [ $ear -gt 0  ]
then
  for j in *.ear
  do
    #mv $j /deploy/
    fname=${i%.ear}
    mkdir /deploy/$fname
    unzip -d /deploy/$fname $j
  done
fi

tail -f /dev/null
