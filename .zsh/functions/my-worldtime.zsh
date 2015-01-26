my-worldtime () {
    alias datetime="date +%a-%d-%b,%H:%M"
    clear;
    echo -e 'What time is it in Europa?'
    echo -e '=========================='
    echo -e 'Amsterdam:\t\t' "$(TZ="Europe/Amsterdam" datetime)"
    echo -e 'Madrid:   \t\t' "$(TZ="Europe/Madrid" datetime)"
    echo -e 'Berlin:   \t\t' "$(TZ="Europe/Berlin" datetime)"
    echo -e 'Sofia:    \t\t' "$(TZ="Europe/Sofia" datetime)"
    echo -e 'Moscow:   \t\t' "$(TZ="Europe/Moscow" datetime)"
    echo -e 'Istanbul: \t\t' "$(TZ="Europe/Istanbul" datetime)"
    echo -e 'London:   \t\t' "$(TZ="Europe/London" datetime)"
    echo -e ''
    echo -e 'What time is it in America?'
    echo -e '==========================='
    echo -e 'NYC:        \t\t' "$(TZ="America/New_York" datetime)"
    echo -e 'Bogota:     \t\t' "$(TZ="America/Bogota" datetime)"
    echo -e 'Mexico City:\t\t' "$(TZ="America/Mexico_City" datetime)"
    echo -e ''
    echo -e 'What time is it in Asia?'
    echo -e '========================'
    echo -e 'Tokyo:    \t\t' "$(TZ="Asia/Tokyo" datetime)"
    echo -e 'Bangkok:  \t\t' "$(TZ="Asia/Bangkok" datetime)"
    echo -e 'HongKong: \t\t' "$(TZ="Asia/Shanghai" datetime)"
}
