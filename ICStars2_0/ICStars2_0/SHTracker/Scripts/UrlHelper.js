function UrlHelper(url) {
    if (UrlHelper.arguments.length == 1) {
        this.Url = url;
    } else {
        this.Url = document.location.href;
    }

    var url = "";
    var r = new RegExp("^([a-z]+?):\/\/", "ig");
    if (r.test(this.Url) == true) {
        this.Scheme = RegExp.$1;

        url += RegExp.$1 + "://";
        r = new RegExp("^" + this.Scheme + "\:\/\/([\\w|\\.]+)(\:\\d+)*/?", "ig");
        if (r.test(this.Url) == true) {
            this.Domain = RegExp.$1;
            this.Port = RegExp.$2;

            url += this.Domain + this.Port;
            this.SiteRoot = url.replace("^", "");

            r = new RegExp(url + "(/[^?]+)*", "g");
            if (r.test(this.Url) == true) {
                this.FileName = RegExp.$2;
                this.LocalPath = RegExp.$1 + RegExp.$2;
            }
        }
    }
}
UrlHelper.Current = new UrlHelper();
UrlHelper.prototype.getUrlParameter = function (seekParameter) {
    var url = location.href;
    var parameters = url.substr(url.indexOf("?") + 1);
    var parameterItems = parameters.split("&");
    var parameterName;
    var parameterVar = "";
    for (i in parameterItems) {
        parameterName = parameterItems[i].split("=")[0];
        if (parameterName.toLocaleLowerCase() != seekParameter.toLocaleLowerCase()) continue;
        if (parameterVar != "") {
            parameterVar += ",";
        }
        parameterVar += parameterItems[i].split("=")[1];
    }
    return parameterVar;
}
UrlHelper.prototype.setUrlParameter = function (seekParameter, pValue, _url) {
    var url = location.href;
    if (_url) url = _url;
    if (url.indexOf("?") < 0) {
        return url + "?" + seekParameter + "=" + pValue;
    }
    var parameters = url.substr(url.indexOf("?") + 1);
    if (parameters == "") {
        return url + seekParameter + "=" + pValue;
    }
    var parameterItems = parameters.split("&");
    var parameterName;
    var parameterVar = "";
    var newUrl = this.SiteRoot + this.LocalPath;
    if (_url) {
        var uh = new UrlHelper(_url);
        newUrl = uh.SiteRoot + uh.LocalPath;
    }
    var flag = 0;
    for (i in parameterItems) {
        parameterName = parameterItems[i].split("=")[0];
        if (parameterName == "") continue;
        parameterVar = parameterItems[i].split("=")[1];
        if (parameterName.toLocaleLowerCase() == seekParameter.toLocaleLowerCase()) {
            continue;
        }
            if (flag == 0) {
                newUrl += "?"
            }
            else {
                newUrl += "&";
            }
            flag++;
            newUrl += parameterName + "=" + parameterVar;
        
    }
    if (flag == 0) {
        newUrl += "?"
    }
    else {
        newUrl += "&";
    }
    newUrl += seekParameter + "=" + pValue;
    return newUrl;
}
UrlHelper.prototype.removeUrlParameter = function (seekParameter, _url) {
    var url = location.href;
    if (_url) url = _url;
    if (url.indexOf("?") < 0 || url.indexOf(seekParameter) < 0) {
        return url;
    }
    var parameters = url.substr(url.indexOf("?") + 1);
    if (parameters == "") {
        return url;
    }
    var parameterItems = parameters.split("&");
    var parameterName;
    var parameterVar = "";
    var newUrl = this.SiteRoot + this.LocalPath;
    if (_url) {
        var uh = new UrlHelper(_url);
        newUrl = uh.SiteRoot + uh.LocalPath;
    }
    var flag = 0;
    for (i in parameterItems) {
        parameterName = parameterItems[i].split("=")[0];
        if (parameterName == "") continue;
        parameterVar = parameterItems[i].split("=")[1];

        if (parameterName.toLocaleLowerCase() == seekParameter.toLocaleLowerCase()) {
            continue;
        }
        if (flag == 0) {
            newUrl += "?"
        }
        else {
            newUrl += "&";
        }

        newUrl += parameterName + "=" + parameterVar;
        flag++;
    }
    return newUrl;
}