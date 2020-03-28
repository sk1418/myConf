function FindProxyForURL(url, host) {
	var china_proxy='117.62.175.19:8118'
	if (shExpMatch(url, "*.ifconfig.im")
			||shExpMatch(url, "*.163.com/*")
			||shExpMatch(url, "*.126.net/*")
			||shExpMatch(url,"*.xiami.com/*")) {

		return "PROXY " + china_proxy;
	}
	return "DIRECT";
}
