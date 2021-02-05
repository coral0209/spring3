const loadChannelTalk = () => {
    var w = window;
    if (w.ChannelIO) {
        return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
        ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
        ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
        if (w.ChannelIOInitialized) {
            return;
        }
        w.ChannelIOInitialized = true;
        var s = document.createElement('script');
        s.type = 'text/javascript';
        s.async = true;
        s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
        s.charset = 'UTF-8';
        var x = document.getElementsByTagName('script')[0];
        x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
        l();
    } else if (window.attachEvent) {
        window.attachEvent('onload', l);
    } else {
        window.addEventListener('DOMContentLoaded', l, false);
        window.addEventListener('load', l, false);
    }
};

const bootChannelTalk = (user) => {
    if (!user) {
        window.ChannelIO('boot', {
            "pluginKey": "3ed2c385-4c51-4b90-89b7-025041bedc4e"
        });
        return;
    }

    window.ChannelIO('boot', {
        "pluginKey": "3ed2c385-4c51-4b90-89b7-025041bedc4e",
    });
}

const getServiceMode = function() {
    const hostname = window.location.hostname;

    if (!hostname) {
        return 'prod';
    }

    if (hostname.indexOf('localhost') > -1) {
        return 'local';
    } else if (hostname.indexOf('sdhprep.cafe24.com') > -1) {
        return 'dev';
    }

    return "prod";
};

const shutdownChannelTalk = () => {
    window.ChannelIO('shutdown');
};

$( document ).ready(() => {
    if (getServiceMode() === 'prod') {
        loadChannelTalk();
        bootChannelTalk();
    }
});