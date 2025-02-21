run_extractor () {
	ext=${1##*.}
	case "$ext" in
		"7z")
			tst=`which 7z`
			if [ $? -eq 0 ]; then
				mkdir -pv "${2}"
				7z x "${1}" -o"${2}"
			fi
			;;

		"zip")
			tst=`which unzip`
			if [ $? -eq 0 ]; then
				mkdir -pv "${2}"
				unzip -d"${2}" "${1}"
			fi
			;;

		*)
			echo ""
			;;
	esac
}

junk_name () {
	nm=`cat /proc/sys/kernel/random/uuid | sed 's/[-]//g' | head -c 20; echo;`
	echo "jnk_$nm"
}
