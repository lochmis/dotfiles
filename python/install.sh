
install () {
    install_pip && install_virtualenvwrapper
}

install_virtualenvwrapper () {
    ~/.local/bin/pip install --user virtualenvwrapper
}

install_pip () {
    local get_pip_file=/tmp/get-pip.py

    if [ ! -e ~/.local/bin/pip ]
    then
        get_url_to_file "https://bootstrap.pypa.io/get-pip.py" "${get_pip_file}" || return 1
        python "${get_pip_file}" --user
        rm "${get_pip_file}"
    fi
}

get_url_to_file () {
    local url=$1
    local filename=$2

    if which wget >/dev/null
    then
        wget --output-document "${filename}" "${url}"
    elif which curl >/dev/null
    then
        curl --output "${filename}" "${url}"
    else
        echo "Unable to install python... wget and curl commands not found"
        return 1
    fi
}

install
