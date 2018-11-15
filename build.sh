#!/bin/bash
if test "$OS" = "Windows_NT"
then
  # use .Net

  .paket/paket.exe restore
  exit_code=$?
  if [ $exit_code -ne 0 ]; then
  	exit $exit_code
  fi
  fake-runner\fake.exe run build.fsx $@
else
  # use mono

  mono .paket/paket.exe restore
  exit_code=$?
  if [ $exit_code -ne 0 ]; then
  	exit $exit_code
  fi
  mono fake-runner\fake.exe run build.fsx $@
fi