// Alex Norton 2106
// Scripts for scraping town names from MMA --> Massachusetts Municiple Association

// Usage:
// 		Go to: https://www.mma.org/city-and-town-web-sites
// 		Open console, paste following code



var panels = document.getElementById("slider").getElementsByClassName("panel")
var paths = [];

for (var i=0; i < panels.length; i++) {
	var links = panels[i].getElementsByClassName("linkRow");
	for (var j = 0; j < links.length; j++) {
		var link = links[j].getElementsByClassName("comLink")[0];
		if (link.getElementsByTagName("a").length) { 
			var URL = link.getElementsByTagName("a")[0].getAttribute("href");
			console.log(URL);
			paths.push(URL);
		}
	}
}