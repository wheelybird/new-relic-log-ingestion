#!/usr/bin/env bash

build_dir=${build_dir:-/tmp/build_dir}
python_version=${python_version:-3.9}
archive_name=${archive_name:-newrelic-log-ingestion.zip}

echo "Checking for required commands"
for cm in git pipenv zip; do
  command -v $cm
  if [ "$?" -ne 0 ]; then echo " - '${cm}' isn't installed."; exit 1; fi
done

mkdir -p $build_dir
if [ ! -f "${build_dir}/src/requirements.txt" ]; then
  echo "Cloning https://github.com/newrelic/aws-log-ingestion.git"
  git clone https://github.com/newrelic/aws-log-ingestion.git $build_dir
fi

cd $build_dir/src
pipenv install --python $python_version
pipenv run pip install --no-cache-dir -r requirements.txt --target .
zip -r ${build_dir}/${archive_name} .
