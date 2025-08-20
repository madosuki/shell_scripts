#!/usr/bin/env bash

if [[ ! -d "${1}" ]]; then
    echo "First argments only accept dirctory path."
    exit 1
fi

target_dir="${1}"
if [[ ! "${target_dir}" =~ /$ ]]; then
    target_dir="${target_dir}"/
fi

dirs=($(ls "${target_dir}" | grep -P "${2}"))

echo "replace target list:"
for i in "${dirs[@]}"
do
    echo "${target_dir}""${i}"
done

read -p "convert charcode and linecode of above files? (y/n)" ans
case "${ans}" in
    [yY]*)
        for i in "${dirs[@]}"
        do
            nkf -w -Lu --overwrite "${target_dir}""${i}"
        done
        ;;
    *)
        exit 0
esac
